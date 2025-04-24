namespace CodePulse.API.Exceptions
{
  public class EmailServiceException : Exception
  {
    public EmailServiceException ( ) : base ( ) { }

    public EmailServiceException ( string message ) : base ( message ) { }

    public EmailServiceException ( string message, Exception innerException )
        : base ( message, innerException ) { }


  }
}
