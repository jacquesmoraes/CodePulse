using CodePulse.API.Exceptions;
using CodePulse.API.Extensions;
using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;
using CodePulse.API.Repositories.Interface;
using CodePulse.API.Repositories.Interface.Service;
using Microsoft.AspNetCore.Identity;



namespace CodePulse.API.Repositories.Implementation
{
  public class AuthRepository : IAuthRepository
  {
    private readonly UserManager<UserProfile> _userManager;
    private readonly IEmailService _emailService;
    private readonly EmailTemplateServiceExtension _emailTemplateServiceExtension;
    private readonly ILogger<AuthRepository> _logger;
  


    public AuthRepository( UserManager<UserProfile> userManager,
      IEmailService emailService,
      EmailTemplateServiceExtension emailTemplateServiceExtension,
      ILogger<AuthRepository> logger)
    {
      _userManager = userManager;
      _emailService = emailService;
      _emailTemplateServiceExtension = emailTemplateServiceExtension;
      _logger = logger;
     
    }

    public async Task<bool> ForgotPasswordAsync(ForgotPasswordRequestDto dto)
{
    try 
    {
        var user = await _userManager.FindByEmailAsync(dto.Email);
        if (user == null) return true; // Retorna true mesmo se usuário não existe para evitar enumeração

        if (!user.EmailConfirmed)
        {
            _logger.LogWarning("Email não confirmado: {Email}", user.Email);
          
        }

        var token = await _userManager.GeneratePasswordResetTokenAsync(user);
        var resetUrl = $"{dto.ClientUrl}?email={Uri.EscapeDataString(user.Email)}&token={Uri.EscapeDataString(token)}";

        // Adicionar template HTML mais elaborado
         var emailBody = await _emailTemplateServiceExtension.GetResetPasswordTemplateAsync(resetUrl);
    await _emailService.SendAsync(user.Email, "Redefinição de Senha", emailBody);

        await _emailService.SendAsync(user.Email, "Redefinição de Senha", emailBody);
        return true;
    }
    catch (Exception ex)
    {
        // Log do erro
        _logger.LogError(ex, "Erro ao processar solicitação de redefinição de senha para {Email}", dto.Email);
        return false;
    }
}

public async Task<bool> ResetPasswordAsync(ResetPasswordRequestDto dto)
{
    try 
    {
        var user = await _userManager.FindByEmailAsync(dto.Email);
        if (user == null)
            return false;

        // Validação adicional de senha
        if (!IsValidPassword(dto.NewPassword))
        {
            throw new BusinessException("password to weak");
        }

        var result = await _userManager.ResetPasswordAsync(user, dto.Token, dto.NewPassword);
        if (!result.Succeeded)
        {
            var errors = string.Join(", ", result.Errors.Select(e => e.Description));
            throw new BusinessException($"password cannot be reset: {errors}");
        }

        // Enviar email de confirmação usando o novo template
        var emailBody = await _emailTemplateServiceExtension.GetPasswordChangedTemplateAsync(user.UserName);
        await _emailService.SendAsync(
            user.Email,
            "Confirmação de Alteração de Senha",
            emailBody
        );

        return true;
    }
    catch (BusinessException)
    {
        throw;
    }
    catch (Exception ex)
    {
        _logger.LogError(ex, "Erro ao redefinir senha para {Email}", dto.Email);
        throw new BusinessException("Ocorreu um erro ao redefinir a senha.");
    }
}


// Método auxiliar para validação de senha
private static bool IsValidPassword(string password)
{
    return password.Length >= 8 && // mínimo 8 caracteres
           password.Any(char.IsUpper) && // pelo menos uma maiúscula
           password.Any(char.IsLower) && // pelo menos uma minúscula
           password.Any(char.IsDigit) && // pelo menos um número
           password.Any(c => !char.IsLetterOrDigit(c)); // pelo menos um caractere especial
}
  }
}
