É
QC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\WeatherForecast.cs
	namespace 	
	CodePulse
 
. 
API 
{ 
public 

class 
WeatherForecast  
{ 
public 
DateOnly 
Date 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
TemperatureC 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
int		 
TemperatureF		 
=>		  "
$num		# %
+		& '
(		( )
int		) ,
)		, -
(		- .
TemperatureC		. :
/		; <
$num		= C
)		C D
;		D E
public 
string 
? 
Summary 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ƒ
hC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Repositories\Interface\IUserRepository.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Repositories $
.$ %
	Interface% .
{ 
public 

	interface 
IUserRepository $
{ 
Task		 
<		 
IdentityResult		 
>		 
CreateUserAsync		 ,
(		, -
UserProfile		- 8
user		9 =
,		= >
string		? E
password		F N
)		N O
;		O P
Task

 
<

 
bool

 
>

 
AssignRoleAsync

 "
(

" #
UserProfile

# .
user

/ 3
,

3 4
string

5 ;
role

< @
)

@ A
;

A B
Task "
CreateUserProfileAsync #
(# $
UserProfile$ /
profile0 7
)7 8
;8 9
Task 
< 
UserProfileDto 
? 
> '
GetUserProfileByUserIdAsync 9
(9 :
string: @
userIdA G
)G H
;H I
Task 
< (
UpdateUserProfileResponseDto )
?) *
>* +"
UpdateUserProfileAsync, B
(B C
stringC I
userIdJ P
,P Q'
UpdateUserProfileRequestDtoR m
requestn u
)u v
;v w
Task 
< 
bool 
> "
DeleteUserProfileAsync )
() *
string* 0
userId1 7
)7 8
;8 9
Task 
< 
UserProfileDto 
? 
> )
GetUserProfileByUserNameAsync ;
(; <
string< B
usernameC K
)K L
;L M
Task 
< 
List 
< 
UserProfileDto  
>  !
>! "
GetAllProfilesAsync# 6
(6 7
)7 8
;8 9
Task 
< 
UserProfile 
? 
> /
#GetUserProfileByIdentityUserIdAsync >
(> ?
string? E
userIdF L
)L M
;M N
} 
} ‰
qC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Repositories\Interface\IUserManagmentRepository.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Repositories $
.$ %
	Interface% .
{ 
public 
	interface	 $
IUserManagmentRepository +
{ 
Task		 	
<			 

UserProfile		
 
>		 
CreateUserAsync		 &
(		& '
UserProfile		' 2
userProfile		3 >
,		> ?
string		@ F
password		G O
,		O P
string		Q W
email		X ]
,		] ^
string		_ e
role		f j
)		j k
;		k l
Task

 
<

 	
List

	 
<

 
UserProfile

 
>

 
>

 
GetAllUsersAsync

 ,
(

, -
)

- .
;

. /
Task 
< 	
UserProfile	 
? 
> 
GetWriterByIdAsync )
() *
string* 0
userId1 7
)7 8
;8 9
Task 
< 	
UserProfile	 
? 
> 
UpdateUserRoleAsync *
(* +
string+ 1
userId2 8
,8 9
string: @
newRoleA H
)H I
;I J
Task 
< 	
UserProfile	 
? 
> 
RemoveUserAsync &
(& '
string' -
userIdToRemove. <
,< =
ClaimsPrincipal> M
currentUserN Y
)Y Z
;Z [
Task 
< 	
bool	 
> 
IsUserWriterAsync  
(  !
string! '
userId( .
). /
;/ 0
} 
} ·
tC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Repositories\Interface\IUserImageProfileRepository.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Repositories $
.$ %
	Interface% .
{ 
public 
	interface	 '
IUserImageProfileRepository .
{ 
Task 
< 	
UserImageProfile	 
> 
SaveUserImageAsync -
(. /
	IFormFile0 9
file: >
)> ?
;? @
} 
}		 â
iC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Repositories\Interface\ITokenRepository.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Repositories $
.$ %
	Interface% .
{ 
public 
	interface	 
ITokenRepository #
{ 
public 

string 
CreateJwtToken  
(  !
UserProfile! ,
user- 1
,1 2
List3 7
<7 8
string8 >
>> ?
roles@ E
)F G
;G H
} 
}		 ˝
iC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Repositories\Interface\IImageRepository.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Repositories $
.$ %
	Interface% .
{ 
public 
	interface	 
IImageRepository #
{ 
Task 
< 	
	BlogImage	 
> 
SaveImageAsync "
(# $
	IFormFile% .
file/ 3
,3 4
string5 ;
fileName< D
)E F
;F G
} 
}		 ˜

lC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Repositories\Interface\IFavoriteRepository.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Repositories $
.$ %
	Interface% .
{ 
public 
	interface	 
IFavoriteRepository &
{ 
Task 
< 	
IEnumerable	 
< 
FavoritePostDto $
>$ %
>% &"
GetFavoriteByUserAsync' =
(> ?
string@ F
userIdG M
)N O
;O P
Task 
< 	
FavoritePostDto	 
? 
> 
AddToFavoritesAsync .
(/ 0
string1 7
userId8 >
,> ?
Guid@ D
postIdE K
)L M
;M N
Task		 
<		 	
bool			 
>		 $
RemoveFromFavoritesAsync		 '
(		( )
string		* 0
userId		1 7
,		7 8
Guid		9 =
postId		> D
)		E F
;		F G
Task

 
<

 	
bool

	 
>

 &
IsPostFavoritedByUserAsync

 )
(

* +
string

, 2
userId

3 9
,

9 :
Guid

; ?
postId

@ F
)

G H
;

H I
} 
} Ù
lC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Repositories\Interface\ICategoryRepository.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Repositories $
.$ %
	Interface% .
{ 
public 
	interface	 
ICategoryRepository &
{ 
Task 
< 	
Category	 
> 
CreateAsync 
( 
Category '
category( 0
)0 1
;1 2
Task 
< 	
IEnumerable	 
< 
Category 
> 
> 
GetAllCategories  0
(0 1
string1 7
?7 8
query9 >
=? @
nullA E
,E F
string		 
?		 
sortBy		 
=		 
null		 
,		 
string

 
?

 
sortDirection

 
=

 
null

 "
,

" #
int 	
?	 


pageNumber 
= 
$num 
, 
int 	
?	 

pageSize 
= 
$num 
) 
; 
Task 
< 	
int	 
> #
GetCategoriesCountAsync %
(% &
)& '
;' (
Task 
< 	
Category	 
? 
>  
GetCategoryByIdAsync (
(( )
Guid) -
id. 0
)0 1
;1 2
Task 
< 	
Category	 
? 
> 
UpdateCategoryAsync '
(' (
Category( 0
category1 9
)9 :
;: ;
Task 
< 	
Category	 
? 
> 
DeleteCategoryAsync '
(' (
Guid( ,
id- /
)/ 0
;0 1
} 
} ì
lC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Repositories\Interface\IBlogPostRepository.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Repositories $
.$ %
	Interface% .
{ 
public 
	interface	 
IBlogPostRepository &
{ 
Task 
< 	
BlogPost	 
> 
CreateBlogPostAsync &
(& '
BlogPost' /
blogPost0 8
)8 9
;9 :
Task		 
<		 	
IEnumerable			 
<		 
BlogPost		 
>		 
>		 
GetAllAsync		  +
(		+ ,
string		, 2
?		2 3
query		4 9
=		: ;
null		< @
,		@ A
string

 
?

 
sortBy

 
=

 
null

 
,

 
string 
? 
sortDirection 
= 
null "
," #
int 	
?	 


pageNumber 
= 
$num 
, 
int 	
?	 

pageSize 
= 
$num 
) 
; 
Task 
< 	
int	 
> "
GetBlogPostsCountAsync $
($ %
)% &
;& '
Task 
< 	
BlogPost	 
? 
>  
GetBlogPostByIdAsync (
(( )
Guid) -
id. 0
)0 1
;1 2
Task 
< 	
BlogPost	 
? 
> "
GetBlogPostByUrlHandle *
(* +
string+ 1
	urlhandle2 ;
); <
;< =
Task 
< 	
IEnumerable	 
< 
BlogPost 
> 
> (
GetPopularPostsByAuthorAsync  <
(< =
string= C
authorIdD L
,L M
intN Q
countR W
=X Y
$numZ [
)\ ]
;] ^
Task 
< 	
BlogPost	 
? 
> 
UpdateBlogPostAsync '
(' (
BlogPost( 0
UpdateBlogPost1 ?
)? @
;@ A
Task 
< 	
IEnumerable	 
< 
BlogPost 
> 
>  
GetRelatedPostsAsync  4
(4 5
Guid5 9
postId: @
)@ A
;A B
Task 
< 	
BlogPost	 
? 
> 
DeleteBlogPostAsync '
(' (
Guid( ,
id- /
)/ 0
;0 1
Task 
< 	
IEnumerable	 
< 
BlogPost 
> 
> 
GetPopularPosts  /
(/ 0
int0 3
count4 9
=: ;
$num< =
)= >
;> ?
Task 
< 	
IEnumerable	 
< 
BlogPost 
> 
>  
GetPostByAuthorAsync  4
(4 5
string5 ;
authorId< D
)D E
;E F
} 
} ¸¶
lC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Repositories\Implementation\UserRepository.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Repositories $
.$ %
Implementation% 3
{		 
public

 
class

	 
UserRepository

 
:

 
IUserRepository

  /
{ 
private 
readonly 
UserManager  
<  !
UserProfile! ,
>, -
_userManager. :
;: ;
private 
readonly 
AuthContext  
_context! )
;) *
private 
readonly 
IWebHostEnvironment (
_environment) 5
;5 6
private 
readonly '
IUserImageProfileRepository 0 
_userImageRepository1 E
;E F
private 
readonly 
ILogger 
< 
UserRepository +
>+ ,
_logger- 4
;4 5
public 

UserRepository 
( 
UserManager 
< 
UserProfile 
> 
userManager *
,* +
AuthContext 
context 
, 
IWebHostEnvironment 
environment %
,% &'
IUserImageProfileRepository !
userImageRepository" 5
,5 6
ILogger 
< 
UserRepository 
> 
logger $
)$ %
{ 
_userManager 
= 
userManager  
;  !
_context 
= 
context 
; 
_environment 
= 
environment  
;  ! 
_userImageRepository 
= 
userImageRepository 0
;0 1
_logger 
= 
logger 
; 
} 
public   

async   
Task   
<   
IdentityResult   $
>  $ %
CreateUserAsync  & 5
(  5 6
UserProfile  6 A
user  B F
,  F G
string  H N
password  O W
)  W X
{!! 
return"" 
await"" 
_userManager"" 
.""  
CreateAsync""  +
(""+ ,
user"", 0
,""0 1
password""2 :
)"": ;
;""; <
}## 
public%% 

async%% 
Task%% 
<%% 
bool%% 
>%% 
AssignRoleAsync%% +
(%%+ ,
UserProfile%%, 7
user%%8 <
,%%< =
string%%> D
role%%E I
)%%I J
{&& 
var'' 	
result''
 
='' 
await'' 
_userManager'' %
.''% &
AddToRoleAsync''& 4
(''4 5
user''5 9
,''9 :
role''; ?
)''? @
;''@ A
return(( 
result(( 
.(( 
	Succeeded(( 
;(( 
})) 
public++ 

async++ 
Task++ "
CreateUserProfileAsync++ ,
(++, -
UserProfile++- 8
profile++9 @
)++@ A
{,, 
await-- 
_context-- 
.-- 
UsersProfiles-- "
.--" #
AddAsync--# +
(--+ ,
profile--, 3
)--3 4
;--4 5
await.. 
_context.. 
... 
SaveChangesAsync.. %
(..% &
)..& '
;..' (
}// 
public11 

async11 
Task11 
<11 
UserProfileDto11 $
?11$ %
>11% &'
GetUserProfileByUserIdAsync11' B
(11B C
string11C I
userId11J P
)11P Q
{22 
_logger33 
.33 
LogInformation33 
(33 
$"33 
$str33 K
{33K L
userId33L R
}33R S
"33S T
)33T U
;33U V
var55 	
profile55
 
=55 
await55 
_context55 "
.55" #
UsersProfiles55# 0
.66
 
Include66 
(66 
x66 
=>66 
x66 
.66 
Image66 
)66  
.77
 
AsNoTracking77 
(77 
)77 
.88
 
FirstOrDefaultAsync88 
(88 
p88  
=>88! #
p88$ %
.88% &
Id88& (
==88) +
userId88, 2
)882 3
;883 4
if:: 
(::	 

profile::
 
==:: 
null:: 
):: 
{;; 
_logger<<
 
.<< 

LogWarning<< 
(<< 
$"<< 
$str<< B
{<<B C
userId<<C I
}<<I J
"<<J K
)<<K L
;<<L M
return==
 
null== 
;== 
}>> 
return@@ 
new@@ 
UserProfileDto@@ 
{AA 
IdBB
 
=BB 
profileBB 
.BB 
IdBB 
,BB 
UserNameCC
 
=CC 
profileCC 
.CC 
UserNameCC %
,CC% &
EmailDD
 
=DD 
profileDD 
.DD 
EmailDD 
,DD  
FullNameEE
 
=EE 
profileEE 
.EE 
FullNameEE %
,EE% &
BioFF
 
=FF 
profileFF 
.FF 
BioFF 
,FF 
	InterestsGG
 
=GG 
profileGG 
.GG 
	InterestsGG '
,GG' (
ImageUrlHH
 
=HH 
profileHH 
.HH 
ImageHH "
?HH" #
.HH# $
UrlHH$ '
}II 
;II 
}JJ 
publicLL 

asyncLL 
TaskLL 
<LL (
UpdateUserProfileResponseDtoLL 2
?LL2 3
>LL3 4"
UpdateUserProfileAsyncLL5 K
(LLK L
stringLLL R
userIdLLS Y
,LLY Z'
UpdateUserProfileRequestDtoLL[ v
requestLLw ~
)LL~ 
{MM 
usingNN 	
varNN
 
transactionNN 
=NN 
awaitNN !
_contextNN" *
.NN* +
DatabaseNN+ 3
.NN3 4!
BeginTransactionAsyncNN4 I
(NNI J
)NNJ K
;NNK L
tryOO 
{PP 
varQQ 
profileQQ 
=QQ 
awaitQQ 
_contextQQ $
.QQ$ %
UsersProfilesQQ% 2
.RR 
IncludeRR 
(RR 
pRR 
=>RR 
pRR 
.RR 
ImageRR !
)RR! "
.SS 
FirstOrDefaultAsyncSS  
(SS  !
pSS! "
=>SS# %
pSS& '
.SS' (
IdSS( *
==SS+ -
userIdSS. 4
)SS4 5
;SS5 6
ifUU 

(UU 
profileUU 
==UU 
nullUU 
)UU 
returnVV 
nullVV 
;VV 
ifYY 

(YY 
!YY 
stringYY 
.YY 
IsNullOrWhiteSpaceYY &
(YY& '
requestYY' .
.YY. /
FullNameYY/ 7
)YY7 8
)YY8 9
profileZZ 
.ZZ 
FullNameZZ 
=ZZ 
requestZZ &
.ZZ& '
FullNameZZ' /
;ZZ/ 0
if\\ 

(\\ 
!\\ 
string\\ 
.\\ 
IsNullOrWhiteSpace\\ &
(\\& '
request\\' .
.\\. /
UserName\\/ 7
)\\7 8
&&\\9 ;
request\\< C
.\\C D
UserName\\D L
!=\\M O
profile\\P W
.\\W X
UserName\\X `
)\\` a
{]] 	
var^^ 
existingProfile^^ 
=^^  !
await^^" '
_context^^( 0
.^^0 1
UsersProfiles^^1 >
.__ 
FirstOrDefaultAsync__ $
(__$ %
p__% &
=>__' )
p__* +
.__+ ,
UserName__, 4
.__4 5
ToLower__5 <
(__< =
)__= >
==__? A
request__B I
.__I J
UserName__J R
.__R S
ToLower__S Z
(__Z [
)__[ \
&&__] _
p__` a
.__a b
Id__b d
!=__e g
userId__h n
)__n o
;__o p
ifaa 
(aa 
existingProfileaa 
!=aa  "
nullaa# '
)aa' (
throwbb 
newbb 
ArgumentExceptionbb +
(bb+ ,
$strbb, M
)bbM N
;bbN O
profiledd 
.dd 
UserNamedd 
=dd 
requestdd &
.dd& '
UserNamedd' /
;dd/ 0
}ee 	
ifgg 

(gg 
!gg 
stringgg 
.gg 
IsNullOrWhiteSpacegg &
(gg& '
requestgg' .
.gg. /
Biogg/ 2
)gg2 3
)gg3 4
profilehh 
.hh 
Biohh 
=hh 
requesthh !
.hh! "
Biohh" %
;hh% &
ifjj 

(jj 
!jj 
stringjj 
.jj 
IsNullOrWhiteSpacejj &
(jj& '
requestjj' .
.jj. /
	Interestsjj/ 8
)jj8 9
)jj9 :
profilekk 
.kk 
	Interestskk 
=kk 
requestkk  '
.kk' (
	Interestskk( 1
;kk1 2
ifnn 

(nn 
requestnn 
.nn 
	ImageFilenn 
!=nn  
nullnn! %
)nn% &
{oo 	
ifpp 
(pp 
profilepp 
.pp 
Imagepp 
!=pp  
nullpp! %
)pp% &
{qq 
varrr 
oldPathrr 
=rr 
Pathrr "
.rr" #
Combinerr# *
(rr* +
_environmentrr+ 7
.rr7 8
WebRootPathrr8 C
,rrC D
profilerrE L
.rrL M
ImagerrM R
.rrR S
UrlrrS V
)rrV W
;rrW X
ifss 
(ss 
Filess 
.ss 
Existsss 
(ss  
oldPathss  '
)ss' (
)ss( )
Filett 
.tt 
Deletett 
(tt  
oldPathtt  '
)tt' (
;tt( )
_contextvv 
.vv 
UserImageProfilesvv *
.vv* +
Removevv+ 1
(vv1 2
profilevv2 9
.vv9 :
Imagevv: ?
)vv? @
;vv@ A
}ww 
varyy 
newImageyy 
=yy 
awaityy   
_userImageRepositoryyy! 5
.yy5 6
SaveUserImageAsyncyy6 H
(yyH I
requestyyI P
.yyP Q
	ImageFileyyQ Z
)yyZ [
;yy[ \
profilezz 
.zz 
ImageIdzz 
=zz 
newImagezz &
.zz& '
Idzz' )
;zz) *
profile{{ 
.{{ 
Image{{ 
={{ 
newImage{{ $
;{{$ %
}|| 	
await~~ 
_context~~ 
.~~ 
SaveChangesAsync~~ '
(~~' (
)~~( )
;~~) *
await 
transaction 
. 
CommitAsync %
(% &
)& '
;' (
return
ÅÅ 
new
ÅÅ *
UpdateUserProfileResponseDto
ÅÅ /
{
ÇÇ 	
UserId
ÉÉ 
=
ÉÉ 
profile
ÉÉ 
.
ÉÉ 
Id
ÉÉ 
,
ÉÉ  
FullName
ÑÑ 
=
ÑÑ 
profile
ÑÑ 
.
ÑÑ 
FullName
ÑÑ '
,
ÑÑ' (
UserName
ÖÖ 
=
ÖÖ 
profile
ÖÖ 
.
ÖÖ 
UserName
ÖÖ '
,
ÖÖ' (
Bio
ÜÜ 
=
ÜÜ 
profile
ÜÜ 
.
ÜÜ 
Bio
ÜÜ 
,
ÜÜ 
	Interests
áá 
=
áá 
profile
áá 
.
áá  
	Interests
áá  )
,
áá) *
Image
àà 
=
àà 
profile
àà 
.
àà 
Image
àà !
!=
àà" $
null
àà% )
?
àà* +
new
àà, /!
UserImageProfileDto
àà0 C
{
ââ 
Id
ää 
=
ää 
profile
ää 
.
ää 
Image
ää "
.
ää" #
Id
ää# %
,
ää% &
FileName
ãã 
=
ãã 
profile
ãã "
.
ãã" #
Image
ãã# (
.
ãã( )
FileName
ãã) 1
,
ãã1 2
FileExtension
åå 
=
åå 
profile
åå  '
.
åå' (
Image
åå( -
.
åå- .
FileExtension
åå. ;
,
åå; <
Url
çç 
=
çç 
profile
çç 
.
çç 
Image
çç #
.
çç# $
Url
çç$ '
}
éé 
:
éé 
null
éé 
}
èè 	
;
èè	 

}
êê 
catch
ëë 	
{
íí 
await
ìì 
transaction
ìì 
.
ìì 
RollbackAsync
ìì '
(
ìì' (
)
ìì( )
;
ìì) *
throw
îî 
;
îî 
}
ïï 
}ññ 
public
òò 	
async
òò
 
Task
òò 
<
òò 
bool
òò 
>
òò $
DeleteUserProfileAsync
òò 1
(
òò1 2
string
òò2 8
userId
òò9 ?
)
òò? @
{ôô 
using
öö 	
var
öö
 
transaction
öö 
=
öö 
await
öö !
_context
öö" *
.
öö* +
Database
öö+ 3
.
öö3 4#
BeginTransactionAsync
öö4 I
(
ööI J
)
ööJ K
;
ööK L
try
úú 
{
ùù 
var
ûû 
profile
ûû 
=
ûû 
await
ûû 
_context
ûû $
.
ûû$ %
UsersProfiles
ûû% 2
.
üü 
Include
üü 
(
üü 
p
üü 
=>
üü 
p
üü 
.
üü 
Image
üü !
)
üü! "
.
†† !
FirstOrDefaultAsync
††  
(
††  !
p
††! "
=>
††# %
p
††& '
.
††' (
Id
††( *
==
††+ -
userId
††. 4
)
††4 5
;
††5 6
if
¢¢ 

(
¢¢ 
profile
¢¢ 
==
¢¢ 
null
¢¢ 
)
¢¢ 
return
££ 
false
££ 
;
££ 
if
¶¶ 

(
¶¶ 
profile
¶¶ 
.
¶¶ 
Image
¶¶ 
!=
¶¶ 
null
¶¶ !
)
¶¶! "
{
ßß 	
var
®® 
	imagePath
®® 
=
®® 
Path
®®  
.
®®  !
Combine
®®! (
(
®®( )
_environment
®®) 5
.
®®5 6
WebRootPath
®®6 A
,
®®A B
profile
®®C J
.
®®J K
Image
®®K P
.
®®P Q
Url
®®Q T
)
®®T U
;
®®U V
if
©© 
(
©© 
File
©© 
.
©© 
Exists
©© 
(
©© 
	imagePath
©© %
)
©©% &
)
©©& '
File
™™ 
.
™™ 
Delete
™™ 
(
™™ 
	imagePath
™™ %
)
™™% &
;
™™& '
_context
¨¨ 
.
¨¨ 
UserImageProfiles
¨¨ &
.
¨¨& '
Remove
¨¨' -
(
¨¨- .
profile
¨¨. 5
.
¨¨5 6
Image
¨¨6 ;
)
¨¨; <
;
¨¨< =
}
≠≠ 	
_context
ØØ 
.
ØØ 
UsersProfiles
ØØ 
.
ØØ 
Remove
ØØ %
(
ØØ% &
profile
ØØ& -
)
ØØ- .
;
ØØ. /
await
∞∞ 
_context
∞∞ 
.
∞∞ 
SaveChangesAsync
∞∞ '
(
∞∞' (
)
∞∞( )
;
∞∞) *
await
±± 
transaction
±± 
.
±± 
CommitAsync
±± %
(
±±% &
)
±±& '
;
±±' (
return
≥≥ 
true
≥≥ 
;
≥≥ 
}
¥¥ 
catch
µµ 	
{
∂∂ 
await
∑∑ 
transaction
∑∑ 
.
∑∑ 
RollbackAsync
∑∑ '
(
∑∑' (
)
∑∑( )
;
∑∑) *
throw
∏∏ 
;
∏∏ 
}
ππ 
}∫∫ 
public
ºº 

async
ºº 
Task
ºº 
<
ºº 
UserProfileDto
ºº $
?
ºº$ %
>
ºº% &+
GetUserProfileByUserNameAsync
ºº' D
(
ººD E
string
ººE K
username
ººL T
)
ººT U
{
ΩΩ 
var
ææ 	
profile
ææ
 
=
ææ 
await
ææ 
_context
ææ "
.
ææ" #
UsersProfiles
ææ# 0
.
øø
 
Include
øø 
(
øø 
x
øø 
=>
øø 
x
øø 
.
øø 
Image
øø 
)
øø  
.
¿¿
 
AsNoTracking
¿¿ 
(
¿¿ 
)
¿¿ 
.
¡¡
 !
FirstOrDefaultAsync
¡¡ 
(
¡¡ 
p
¡¡  
=>
¡¡! #
p
¡¡$ %
.
¡¡% &
UserName
¡¡& .
.
¡¡. /
ToLower
¡¡/ 6
(
¡¡6 7
)
¡¡7 8
==
¡¡9 ;
username
¡¡< D
.
¡¡D E
ToLower
¡¡E L
(
¡¡L M
)
¡¡M N
)
¡¡N O
;
¡¡O P
if
√√ 
(
√√	 

profile
√√
 
==
√√ 
null
√√ 
)
√√ 
return
ƒƒ
 
null
ƒƒ 
;
ƒƒ 
return
∆∆ 
new
∆∆ 
UserProfileDto
∆∆ 
{
«« 
Id
»»
 
=
»» 
profile
»» 
.
»» 
Id
»» 
,
»» 
UserName
……
 
=
…… 
profile
…… 
.
…… 
UserName
…… %
,
……% &
Email
  
 
=
   
profile
   
.
   
Email
   
,
    
FullName
ÀÀ
 
=
ÀÀ 
profile
ÀÀ 
.
ÀÀ 
FullName
ÀÀ %
,
ÀÀ% &
Bio
ÃÃ
 
=
ÃÃ 
profile
ÃÃ 
.
ÃÃ 
Bio
ÃÃ 
,
ÃÃ 
	Interests
ÕÕ
 
=
ÕÕ 
profile
ÕÕ 
.
ÕÕ 
	Interests
ÕÕ '
,
ÕÕ' (
ImageUrl
ŒŒ
 
=
ŒŒ 
profile
ŒŒ 
.
ŒŒ 
Image
ŒŒ "
?
ŒŒ" #
.
ŒŒ# $
Url
ŒŒ$ '
}
œœ 
;
œœ 
}
–– 
public
““ 

async
““ 
Task
““ 
<
““ 
List
““ 
<
““ 
UserProfileDto
““ )
>
““) *
>
““* +!
GetAllProfilesAsync
““, ?
(
““? @
)
““@ A
{
”” 
return
‘‘ 
await
‘‘ 
_context
‘‘ 
.
‘‘ 
UsersProfiles
‘‘ )
.
’’
 
Include
’’ 
(
’’ 
p
’’ 
=>
’’ 
p
’’ 
.
’’ 
Image
’’ 
)
’’  
.
÷÷
 
Select
÷÷ 
(
÷÷ 
p
÷÷ 
=>
÷÷ 
new
÷÷ 
UserProfileDto
÷÷ )
{
◊◊
 
Id
ÿÿ 
=
ÿÿ 
p
ÿÿ 
.
ÿÿ 
Id
ÿÿ 
,
ÿÿ 
UserName
ŸŸ 
=
ŸŸ 
p
ŸŸ 
.
ŸŸ 
UserName
ŸŸ !
,
ŸŸ! "
Email
⁄⁄ 
=
⁄⁄ 
p
⁄⁄ 
.
⁄⁄ 
Email
⁄⁄ 
,
⁄⁄ 
FullName
€€ 
=
€€ 
p
€€ 
.
€€ 
FullName
€€ !
,
€€! "
Bio
‹‹ 
=
‹‹ 
p
‹‹ 
.
‹‹ 
Bio
‹‹ 
,
‹‹ 
	Interests
›› 
=
›› 
p
›› 
.
›› 
	Interests
›› #
,
››# $
ImageUrl
ﬁﬁ 
=
ﬁﬁ 
p
ﬁﬁ 
.
ﬁﬁ 
Image
ﬁﬁ 
!=
ﬁﬁ !
null
ﬁﬁ" &
?
ﬁﬁ' (
p
ﬁﬁ) *
.
ﬁﬁ* +
Image
ﬁﬁ+ 0
.
ﬁﬁ0 1
Url
ﬁﬁ1 4
:
ﬁﬁ5 6
null
ﬁﬁ7 ;
}
ﬂﬂ
 
)
ﬂﬂ 
.
‡‡
 
ToListAsync
‡‡ 
(
‡‡ 
)
‡‡ 
;
‡‡ 
}
·· 
public
„„ 

async
„„ 
Task
„„ 
<
„„ 
UserProfile
„„ !
?
„„! "
>
„„" #1
#GetUserProfileByIdentityUserIdAsync
„„$ G
(
„„G H
string
„„H N
userId
„„O U
)
„„U V
{
‰‰ 
return
ÂÂ 
await
ÂÂ 
_context
ÂÂ 
.
ÂÂ 
UsersProfiles
ÂÂ )
.
ÊÊ
 !
FirstOrDefaultAsync
ÊÊ 
(
ÊÊ 
p
ÊÊ  
=>
ÊÊ! #
p
ÊÊ$ %
.
ÊÊ% &
Id
ÊÊ& (
==
ÊÊ) +
userId
ÊÊ, 2
)
ÊÊ2 3
;
ÊÊ3 4
}
ÁÁ 
}ÍÍ 
}ÎÎ ¨ï
uC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Repositories\Implementation\UserManagmentRepository.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Repositories $
.$ %
Implementation% 3
;3 4
public		 
class		 $
UserManagementRepository		 %
:		& '$
IUserManagmentRepository		( @
{

 
private 	
readonly
 
UserManager 
< 
UserProfile *
>* +
_userManager, 8
;8 9
private 	
readonly
 
IWebHostEnvironment &
_environment' 3
;3 4
private 	
readonly
 
ApplicationContext %
_appContext& 1
;1 2
private 	
readonly
 
ILogger 
< $
UserManagementRepository 3
>3 4
_logger15 =
;= >
private 	
readonly
 
AuthContext 
_context '
;' (
public $
UserManagementRepository	 !
(" #
UserManager 
< 
UserProfile 
> 
userManager *
,* +
IWebHostEnvironment 
environment %
,% &
ApplicationContext 

appContext #
,# $
ILogger 
< $
UserManagementRepository &
>& '
logger1( /
,/ 0
AuthContext 
context 
) 
{ 
_userManager 
= 
userManager 
; 
_environment 
= 
environment 
; 
_appContext 
= 

appContext 
; 
_logger1 
= 
logger1 
; 
_context 
= 
context 
; 
} 
public 
async	 
Task 
< 
UserProfile 
>  
CreateUserAsync! 0
(0 1
UserProfile1 <
userProfile= H
,H I
stringJ P
passwordQ Y
,Y Z
string[ a
emailb g
,g h
stringi o
rolep t
)t u
{   
using!! 	
var!!
 
transaction!! 
=!! 
await!! !
_context!!" *
.!!* +
Database!!+ 3
.!!3 4!
BeginTransactionAsync!!4 I
(!!I J
)!!J K
;!!K L
try## 
{$$ 
userProfile&& 
.&& 
UserName&& 
=&& 
userProfile&& *
.&&* +
UserName&&+ 3
.&&3 4
Replace&&4 ;
(&&; <
$str&&< ?
,&&? @
$str&&A C
)&&C D
;&&D E
userProfile'' 
.'' 
Email'' 
='' 
email'' !
;''! "
userProfile(( 
.(( 
EmailConfirmed(( "
=((# $
true((% )
;(() *
userProfile)) 
.)) 
NormalizedUserName)) &
=))' (
userProfile))) 4
.))4 5
UserName))5 =
.))= >
ToUpper))> E
())E F
)))F G
;))G H
userProfile** 
.** 
NormalizedEmail** #
=**$ %
email**& +
.**+ ,
ToUpper**, 3
(**3 4
)**4 5
;**5 6
var-- 
result-- 
=-- 
await-- 
_userManager-- '
.--' (
CreateAsync--( 3
(--3 4
userProfile--4 ?
,--? @
password--A I
)--I J
;--J K
if.. 

(.. 
!.. 
result.. 
... 
	Succeeded.. 
).. 
throw// 
new//  
ApplicationException// *
(//* +
$str//+ E
+//F G
string//H N
.//N O
Join//O S
(//S T
$str//T X
,//X Y
result//Z `
.//` a
Errors//a g
.//g h
Select//h n
(//n o
e//o p
=>//q s
e//t u
.//u v
Description	//v Å
)
//Å Ç
)
//Ç É
)
//É Ñ
;
//Ñ Ö
if22 

(22 
role22 
!=22 
$str22 
&&22 
role22  $
!=22% '
$str22( .
)22. /
{33 	
await55 
_userManager55 
.55 
DeleteAsync55 *
(55* +
userProfile55+ 6
)556 7
;557 8
throw66 
new66  
ApplicationException66 *
(66* +
$str66+ U
)66U V
;66V W
}77 	
var:: 

roleResult:: 
=:: 
await:: 
_userManager:: +
.::+ ,
AddToRoleAsync::, :
(::: ;
userProfile::; F
,::F G
role::H L
)::L M
;::M N
if;; 

(;; 
!;; 

roleResult;; 
.;; 
	Succeeded;; !
);;! "
{<< 	
await== 
_userManager== 
.== 
DeleteAsync== *
(==* +
userProfile==+ 6
)==6 7
;==7 8
throw>> 
new>>  
ApplicationException>> *
(>>* +
$">>+ -
$str>>- H
{>>H I
role>>I M
}>>M N
">>N O
)>>O P
;>>P Q
}?? 	
awaitAA 
transactionAA 
.AA 
CommitAsyncAA %
(AA% &
)AA& '
;AA' (
returnCC 
awaitCC 
_userManagerCC !
.CC! "
FindByIdAsyncCC" /
(CC/ 0
userProfileCC0 ;
.CC; <
IdCC< >
)CC> ?
;CC? @
}DD 
catchEE 	
{FF 
awaitGG 
transactionGG 
.GG 
RollbackAsyncGG '
(GG' (
)GG( )
;GG) *
throwHH 
;HH 
}II 
}JJ 
publicNN 
asyncNN	 
TaskNN 
<NN 
ListNN 
<NN 
UserProfileNN $
>NN$ %
>NN% &
GetAllUsersAsyncNN' 7
(NN8 9
)NN: ;
{OO 
returnPP 

awaitPP 
_contextPP 
.PP 
UsersProfilesPP '
.PP' (
ToListAsyncPP( 3
(PP4 5
)PP6 7
;PP7 8
}QQ 
publicSS 
asyncSS	 
TaskSS 
<SS 
UserProfileSS 
?SS  
>SS  !
GetWriterByIdAsyncSS" 4
(SS5 6
stringSS7 =
userIdSS> D
)SSE F
{TT 
ifUU 
(UU 
!UU	 

awaitUU
 
IsUserWriterAsyncUU !
(UU" #
userIdUU$ *
)UU+ ,
)UU- .
returnVV 
nullVV 
;VV 
returnXX 

awaitXX 
_userManagerXX 
.XX 
FindByIdAsyncXX +
(XX, -
userIdXX. 4
)XX5 6
;XX6 7
}YY 
public[[ 
async[[	 
Task[[ 
<[[ 
UserProfile[[ 
?[[  
>[[  !
UpdateUserRoleAsync[[" 5
([[6 7
string[[8 >
userId[[? E
,[[E F
string[[G M
newRole[[N U
)[[V W
{\\ 
using]] 	
var]]
 
transaction]] 
=]] 
await]] !
_context]]" *
.]]* +
Database]]+ 3
.]]3 4!
BeginTransactionAsync]]4 I
(]]I J
)]]J K
;]]K L
try^^ 
{__ 
var`` 	
user``
 
=`` 
await`` 
_userManager`` #
.``# $
FindByIdAsync``$ 1
(``1 2
userId``2 8
)``8 9
;``9 :
ifaa 
(aa	 

useraa 
==aa 
nullaa 
)aa 
returnbb 
nullbb 
;bb 
ifee 
(ee	 

newRoleee 
!=ee 
$stree 
&&ee !
newRoleee" )
!=ee* ,
$stree- 3
)ee4 5
throwff 
newff  
ApplicationExceptionff &
(ff' (
$strff) Q
)ffR S
;ffS T
varii 	
currentRolesii
 
=ii 
awaitii 
_userManagerii +
.ii+ ,
GetRolesAsyncii, 9
(ii9 :
userii: >
)ii> ?
;ii? @
varll 	
removeResultll
 
=ll 
awaitll 
_userManagerll +
.ll+ , 
RemoveFromRolesAsyncll, @
(ll@ A
userllA E
,llE F
currentRolesllG S
)llS T
;llT U
ifmm 
(mm	 

!mm 
removeResultmm 
.mm 
	Succeededmm "
)mm# $
thrownn 
newnn  
ApplicationExceptionnn &
(nn' (
$strnn) J
+nnK L
stringnnM S
.nnS T
JoinnnT X
(nnY Z
$strnn[ _
,nn_ `
removeResultnna m
.nnm n
Errorsnnn t
.nnt u
Selectnnu {
(nn| }
enn~ 
=>
nnÄ Ç
e
nnÉ Ñ
.
nnÑ Ö
Description
nnÖ ê
)
nnë í
)
nnì î
)
nnï ñ
;
nnñ ó
varqq 	
	addResultqq
 
=qq 
awaitqq 
_userManagerqq (
.qq( )
AddToRoleAsyncqq) 7
(qq7 8
userqq8 <
,qq< =
newRoleqq> E
)qqE F
;qqF G
ifrr 
(rr	 

!rr 
	addResultrr 
.rr 
	Succeededrr 
)rr  !
throwss 
newss  
ApplicationExceptionss &
(ss' (
$strss) I
+ssJ K
stringssL R
.ssR S
JoinssS W
(ssX Y
$strssZ ^
,ss^ _
	addResultss` i
.ssi j
Errorsssj p
.ssp q
Selectssq w
(ssx y
essz {
=>ss| ~
e	ss Ä
.
ssÄ Å
Description
ssÅ å
)
ssç é
)
ssè ê
)
ssë í
;
ssí ì
awaituu 
transactionuu 
.uu 
CommitAsyncuu #
(uu$ %
)uu& '
;uu' (
returnvv 
uservv 
;vv 
}ww 
catchxx 	
{yy 
awaitzz 
transactionzz 
.zz 
RollbackAsynczz %
(zz& '
)zz( )
;zz) *
throw{{ 
;{{ 
}|| 
}}} 
public
ÄÄ 
async
ÄÄ	 
Task
ÄÄ 
<
ÄÄ 
UserProfile
ÄÄ 
?
ÄÄ  
>
ÄÄ  !
RemoveUserAsync
ÄÄ" 1
(
ÄÄ1 2
string
ÄÄ2 8
userIdToRemove
ÄÄ9 G
,
ÄÄG H
ClaimsPrincipal
ÄÄI X
currentUser
ÄÄY d
)
ÄÄd e
{ÅÅ 
using
ÇÇ 	
var
ÇÇ
 
transaction
ÇÇ 
=
ÇÇ 
await
ÇÇ !
_context
ÇÇ" *
.
ÇÇ* +
Database
ÇÇ+ 3
.
ÇÇ3 4#
BeginTransactionAsync
ÇÇ4 I
(
ÇÇI J
)
ÇÇJ K
;
ÇÇK L
try
ÑÑ 
{
ÖÖ 
var
áá 
loggedUserId
áá 
=
áá 
currentUser
áá &
.
áá& '
FindFirstValue
áá' 5
(
áá5 6

ClaimTypes
áá6 @
.
áá@ A
NameIdentifier
ááA O
)
ááO P
;
ááP Q
var
àà 
isAdmin
àà 
=
àà 
currentUser
àà !
.
àà! "
IsInRole
àà" *
(
àà* +
$str
àà+ 2
)
àà2 3
;
àà3 4
if
ãã 

(
ãã 
!
ãã 
isAdmin
ãã 
&&
ãã 
userIdToRemove
ãã &
!=
ãã' )
loggedUserId
ãã* 6
)
ãã6 7
throw
åå 
new
åå )
UnauthorizedAccessException
åå 1
(
åå1 2
$str
åå2 d
)
ååd e
;
ååe f
var
èè 
user
èè 
=
èè 
await
èè 
_userManager
èè %
.
èè% &
FindByIdAsync
èè& 3
(
èè3 4
userIdToRemove
èè4 B
)
èèB C
;
èèC D
if
êê 

(
êê 
user
êê 
==
êê 
null
êê 
)
êê 
return
ëë 
null
ëë 
;
ëë 
var
ìì 
roles
ìì 
=
ìì 
await
ìì 
_userManager
ìì &
.
ìì& '
GetRolesAsync
ìì' 4
(
ìì4 5
user
ìì5 9
)
ìì9 :
;
ìì: ;
var
îî 
isWriter
îî 
=
îî 
roles
îî 
.
îî 
Contains
îî %
(
îî% &
$str
îî& .
)
îî. /
;
îî/ 0
if
óó 

(
óó 
isWriter
óó 
)
óó 
{
òò 	
var
ôô 
profile
ôô 
=
ôô 
await
ôô 
_appContext
ôô  +
.
ôô+ ,
UsersProfiles
ôô, 9
.
öö 
AsNoTracking
öö 
(
öö 
)
öö 
.
õõ 
Include
õõ 
(
õõ 
p
õõ 
=>
õõ 
p
õõ 
.
õõ  
Image
õõ  %
)
õõ% &
.
úú 
Include
úú 
(
úú 
p
úú 
=>
úú 
p
úú 
.
úú  
	BlogPosts
úú  )
)
úú) *
.
ùù !
FirstOrDefaultAsync
ùù $
(
ùù$ %
p
ùù% &
=>
ùù' )
p
ùù* +
.
ùù+ ,
Id
ùù, .
==
ùù/ 1
userIdToRemove
ùù2 @
)
ùù@ A
;
ùùA B
if
üü 
(
üü 
profile
üü 
?
üü 
.
üü 
Image
üü 
!=
üü !
null
üü" &
)
üü& '
{
†† 
var
°° 
	imagePath
°° 
=
°° 
Path
°°  $
.
°°$ %
Combine
°°% ,
(
°°, -
_environment
°°- 9
.
°°9 :
WebRootPath
°°: E
,
°°E F
profile
°°G N
.
°°N O
Image
°°O T
.
°°T U
Url
°°U X
)
°°X Y
;
°°Y Z
if
¢¢ 
(
¢¢ 
File
¢¢ 
.
¢¢ 
Exists
¢¢ 
(
¢¢  
	imagePath
¢¢  )
)
¢¢) *
)
¢¢* +
File
££ 
.
££ 
Delete
££ 
(
££  
	imagePath
££  )
)
££) *
;
££* +
_appContext
•• 
.
•• 
UserImageProfiles
•• -
.
••- .
Remove
••. 4
(
••4 5
profile
••5 <
.
••< =
Image
••= B
)
••B C
;
••C D
}
¶¶ 
if
®® 
(
®® 
profile
®® 
?
®® 
.
®® 
	BlogPosts
®® "
!=
®®# %
null
®®& *
&&
®®+ -
profile
®®. 5
.
®®5 6
	BlogPosts
®®6 ?
.
®®? @
Any
®®@ C
(
®®C D
)
®®D E
)
®®E F
{
©© 
_appContext
™™ 
.
™™ 
	BlogPosts
™™ %
.
™™% &
RemoveRange
™™& 1
(
™™1 2
profile
™™2 9
.
™™9 :
	BlogPosts
™™: C
)
™™C D
;
™™D E
}
´´ 
await
≠≠ 
_appContext
≠≠ 
.
≠≠ 
SaveChangesAsync
≠≠ .
(
≠≠. /
)
≠≠/ 0
;
≠≠0 1
}
ÆÆ 	
if
±± 

(
±± 
roles
±± 
.
±± 
Any
±± 
(
±± 
)
±± 
)
±± 
{
≤≤ 	
var
≥≥ 
removeRolesResult
≥≥ !
=
≥≥" #
await
≥≥$ )
_userManager
≥≥* 6
.
≥≥6 7"
RemoveFromRolesAsync
≥≥7 K
(
≥≥K L
user
≥≥L P
,
≥≥P Q
roles
≥≥R W
)
≥≥W X
;
≥≥X Y
if
¥¥ 
(
¥¥ 
!
¥¥ 
removeRolesResult
¥¥ "
.
¥¥" #
	Succeeded
¥¥# ,
)
¥¥, -
throw
µµ 
new
µµ "
ApplicationException
µµ .
(
µµ. /
$str
µµ/ S
)
µµS T
;
µµT U
}
∂∂ 	
var
ππ 
deleteResult
ππ 
=
ππ 
await
ππ  
_userManager
ππ! -
.
ππ- .
DeleteAsync
ππ. 9
(
ππ9 :
user
ππ: >
)
ππ> ?
;
ππ? @
if
∫∫ 

(
∫∫ 
!
∫∫ 
deleteResult
∫∫ 
.
∫∫ 
	Succeeded
∫∫ #
)
∫∫# $
throw
ªª 
new
ªª "
ApplicationException
ªª *
(
ªª* +
$str
ªª+ G
)
ªªG H
;
ªªH I
await
ΩΩ 
transaction
ΩΩ 
.
ΩΩ 
CommitAsync
ΩΩ %
(
ΩΩ% &
)
ΩΩ& '
;
ΩΩ' (
return
ææ 
user
ææ 
;
ææ 
}
øø 
catch
¿¿ 	
(
¿¿
 )
UnauthorizedAccessException
¿¿ &
ex
¿¿' )
)
¿¿) *
{
¡¡ 
throw
¬¬ 
;
¬¬ 
}
√√ 
catch
ƒƒ 	
(
ƒƒ
 
	Exception
ƒƒ 
ex
ƒƒ 
)
ƒƒ 
{
≈≈ 
await
∆∆ 
transaction
∆∆ 
.
∆∆ 
RollbackAsync
∆∆ '
(
∆∆' (
)
∆∆( )
;
∆∆) *
throw
«« 
new
«« "
ApplicationException
«« &
(
««& '
$str
««' B
+
««C D
ex
««E G
.
««G H
Message
««H O
,
««O P
ex
««Q S
)
««S T
;
««T U
}
»» 
}…… 
public
œœ 
async
œœ	 
Task
œœ 
<
œœ 
bool
œœ 
>
œœ 
IsUserWriterAsync
œœ +
(
œœ, -
string
œœ. 4
userId
œœ5 ;
)
œœ< =
{
–– 
var
—— 
user
—— 
=
—— 
await
—— 
_userManager
—— !
.
——! "
FindByIdAsync
——" /
(
——/ 0
userId
——0 6
)
——6 7
;
——7 8
if
““ 
(
““ 
user
““	 
==
““ 
null
““ 
)
““ 
return
”” 
false
”” 
;
”” 
return
’’ 

await
’’ 
_userManager
’’ 
.
’’ 
IsInRoleAsync
’’ +
(
’’, -
user
’’. 2
,
’’2 3
$str
’’4 <
)
’’= >
;
’’> ?
}
÷÷ 
}◊◊ Ö.
xC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Repositories\Implementation\UserImageProfileRepository.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Repositories $
.$ %
Implementation% 3
{ 
public 
class	 &
UserImageProfileRepository )
:* +'
IUserImageProfileRepository, G
{		 
private

 
readonly

 
IWebHostEnvironment

 (
_environment

) 5
;

5 6
private 
readonly 
AuthContext  
_authContext! -
;- .
public 
&
UserImageProfileRepository %
(& '
IWebHostEnvironment( ;
environment< G
,G H
AuthContextI T
authContextU `
)a b
{ 
_environment 
= 
environment  
;  !
_authContext 
= 
authContext  
;  !
} 
public 

async 
Task 
< 
UserImageProfile &
>& '
SaveUserImageAsync( :
(; <
	IFormFile= F
fileG K
)L M
{ 
if 
(	 

! 
( 
file 
== 
null 
|| 
file "
." #
Length# )
==* ,
$num- .
)/ 0
)1 2
{ 
var 
	extension 
= 
Path 
. 
GetExtension )
() *
file* .
.. /
FileName/ 7
)7 8
.8 9
ToLower9 @
(@ A
)A B
;B C
var 
permited 
= 
new 
[ 
] 
{ 
$str %
,% &
$str' .
,. /
$str0 6
}6 7
;7 8
if 

( 
! 
permited 
. 
Contains 
(  !
	extension" +
), -
). /
{ 	
throw
 
new 
ArgumentException %
(& '
$str( >
)? @
;@ A
} 	
if 

( 
file 
. 
Length 
> 
$num #
)$ %
{ 	
throw
 
new 
ArgumentException %
(& '
$str( G
)H I
;I J
}   	
var!! 
sanitizedFileName!! 
=!! 
Path!!  $
.!!$ %'
GetFileNameWithoutExtension!!% @
(!!@ A
file!!A E
.!!E F
FileName!!F N
)!!N O
.!!O P
Replace!!P W
(!!W X
$str!!X [
,!![ \
$str!!] `
)!!` a
;!!a b
var"" 
fileName"" 
="" 
$""" 
{"" 
sanitizedFileName"" +
}""+ ,
{"", -
	extension"". 7
}""7 8
"""8 9
;""9 :
var## 
relPath## 
=## 
Path## 
.## 
Combine## "
(##" #
$str### 6
,##6 7
fileName##8 @
)##@ A
;##A B
var$$ 
completePath$$ 
=$$ 
Path$$ 
.$$  
Combine$$  '
($$' (
_environment$$( 4
.$$4 5
WebRootPath$$5 @
,$$@ A
relPath$$B I
)$$I J
;$$J K
var%% 
directoryExists%% 
=%% 
Path%% "
.%%" #
GetDirectoryName%%# 3
(%%3 4
completePath%%4 @
)%%@ A
;%%A B
if&& 

(&& 
!&& 
	Directory&& 
.&& 
Exists&& 
(&&  
directoryExists&&! 0
)&&1 2
)&&3 4
{'' 	
	Directory((
 
.(( 
CreateDirectory(( #
((($ %
directoryExists((& 5
!((5 6
)((7 8
;((8 9
})) 	
using** 
(** 
var** 
stream** 
=** 
new**  

FileStream**! +
(**, -
completePath**. :
,**: ;
FileMode**< D
.**D E
Create**E K
)**L M
)**N O
{++ 	
await,,
 
file,, 
.,, 
CopyToAsync,,  
(,,! "
stream,,# )
),,* +
;,,+ ,
}-- 	
var.. 
image.. 
=.. 
new.. 
UserImageProfile.. (
{// 	
Id00
 
=00 
Guid00 
.00 
NewGuid00 
(00 
)00 
,00 
FileName11
 
=11 
sanitizedFileName11 %
,11% &
FileExtension22
 
=22 
	extension22 #
,22# $
Url33
 
=33 
relPath33 
.33 
Replace33 
(33  
$str33  $
,33$ %
$str33& )
)33) *
}44 	
;44	 

_authContext55	 
.55 
UserImageProfiles55 '
.55' (
Add55( +
(55+ ,
image55, 1
)551 2
;552 3
await66 
_authContext66 
.66 
SaveChangesAsync66 +
(66+ ,
)66, -
;66- .
return77 
image77 
;77 
}99 
throw:: 
new:: 
ArgumentException:: !
(::" #
$str::$ 9
)::: ;
;::; <
}<< 
}== 
}>> ¿"
mC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Repositories\Implementation\TokenRepository.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Repositories $
.$ %
Implementation% 3
{		 
public

 

class

 
TokenRepository

  
:

! "
ITokenRepository

# 3
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
public 
TokenRepository 
( 
IConfiguration -
configuration. ;
); <
{ 	
_configuration 
= 
configuration *
;* +
} 	
public 
string 
CreateJwtToken $
($ %
UserProfile% 0
user1 5
,5 6
List7 ;
<; <
string< B
>B C
rolesD I
)I J
{ 	
var 
claims 
= 
new 
List !
<! "
Claim" '
>' (
{ 
new 
Claim 
( 

ClaimTypes $
.$ %
NameIdentifier% 3
,3 4
user5 9
.9 :
Id: <
)< =
,= >
new 
Claim 
( 

ClaimTypes $
.$ %
Email% *
,* +
user, 0
.0 1
Email1 6
??7 9
$str: <
)< =
,= >
new 
Claim 
( 

ClaimTypes $
.$ %
Name% )
,) *
user+ /
./ 0
UserName0 8
??9 ;
$str< >
)> ?
,? @
new 
Claim 
( 
$str $
,$ %
user& *
.* +
FullName+ 3
)3 4
,4 5
new 
Claim 
( 
$str 
,  
user! %
.% &
Bio& )
??* ,
$str- /
)/ 0
,0 1
new 
Claim 
( 
$str %
,% &
user' +
.+ ,
	Interests, 5
??6 8
$str9 ;
); <
} 
; 
claims 
. 
AddRange 
( 
roles !
.! "
Select" (
(( )
role) -
=>. 0
new1 4
Claim5 :
(: ;

ClaimTypes; E
.E F
RoleF J
,J K
roleL P
)P Q
)Q R
)R S
;S T
var"" 
key"" 
="" 
new""  
SymmetricSecurityKey"" .
("". /
Encoding""/ 7
.""7 8
UTF8""8 <
.""< =
GetBytes""= E
(""E F
_configuration""F T
[""T U
$str""U ^
]""^ _
)""_ `
)""` a
;""a b
var## 
credentials## 
=## 
new## !
SigningCredentials##" 4
(##4 5
key##5 8
,##8 9
SecurityAlgorithms##: L
.##L M

HmacSha256##M W
)##W X
;##X Y
var$$ 
token$$ 
=$$ 
new$$ 
JwtSecurityToken$$ ,
($$, -
issuer%% 
:%% 
_configuration%% &
[%%& '
$str%%' 3
]%%3 4
,%%4 5
audience&& 
:&& 
_configuration&& (
[&&( )
$str&&) 7
]&&7 8
,&&8 9
claims'' 
:'' 
claims'' 
,'' 
expires(( 
:(( 
DateTime(( !
.((! "
Now((" %
.((% &
AddHours((& .
(((. /
$num((/ 0
)((0 1
,((1 2
signingCredentials)) "
:))" #
credentials))$ /
)** 
;** 
return,, 
new,, #
JwtSecurityTokenHandler,, .
(,,. /
),,/ 0
.,,0 1

WriteToken,,1 ;
(,,; <
token,,< A
),,A B
;,,B C
}-- 	
}.. 
}// Ï3
mC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Repositories\Implementation\ImageRepository.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Repositories $
.$ %
Implementation% 3
{ 
public		 
class			 
ImageRepository		 
:		  
IImageRepository		! 1
{

 
private 
readonly 
IWebHostEnvironment (
_environment) 5
;5 6
private 
readonly 
ApplicationContext '
_context( 0
;0 1
public 

ImageRepository 
( 
IWebHostEnvironment 0
environment1 <
,< =
ApplicationContext> P
contextQ X
)Y Z
{ 
_environment 
= 
environment  
;  !
_context 
= 
context 
; 
} 
public 

async 
Task 
< 
	BlogImage 
>  
SaveImageAsync! /
(0 1
	IFormFile2 ;
file< @
,@ A
stringB H
nameI M
)N O
{ 
if 
(	 

! 
( 
file 
== 
null 
|| 
file "
." #
Length# )
==* ,
$num- .
)/ 0
)1 2
{ 
var 
	extension 
= 
Path 
. 
GetExtension )
() *
file* .
.. /
FileName/ 7
)7 8
.8 9
ToLower9 @
(@ A
)A B
;B C
var 
permited 
= 
new 
[ 
] 
{ 
$str %
,% &
$str' .
,. /
$str0 6
}6 7
;7 8
if 

( 
! 
permited 
. 
Contains 
(  !
	extension" +
), -
). /
{ 	
throw
 
new 
ArgumentException %
(& '
$str( >
)? @
;@ A
} 	
if   

(   
file   
.   
Length   
>   
$num   #
)  $ %
{!! 	
throw""
 
new"" 
ArgumentException"" %
(""& '
$str""( G
)""H I
;""I J
}## 	
var$$ 
sanitizedFileName$$ 
=$$ 
Path$$  $
.$$$ %'
GetFileNameWithoutExtension$$% @
($$@ A
name$$A E
)$$E F
.$$F G
Replace$$G N
($$N O
$str$$O R
,$$R S
$str$$T W
)$$W X
;$$X Y
var%% 
fileName%% 
=%% 
$"%% 
{%% 
sanitizedFileName%% +
}%%+ ,
{%%, -
	extension%%- 6
}%%6 7
"%%7 8
;%%8 9
var&& 
relPath&& 
=&& 
Path&& 
.&& 
Combine&& "
(&&" #
$str&&# +
,&&+ ,
fileName&&- 5
)&&5 6
;&&6 7
var'' 
completePath'' 
='' 
Path'' 
.''  
Combine''  '
(''' (
_environment''( 4
.''4 5
WebRootPath''5 @
,''@ A
relPath''B I
)''I J
;''J K
var)) 
directoryExists)) 
=)) 
Path)) "
.))" #
GetDirectoryName))# 3
())3 4
completePath))4 @
)))@ A
;))A B
if++ 

(++ 
!++ 
	Directory++ 
.++ 
Exists++ 
(++  
directoryExists++! 0
)++1 2
)++3 4
{,, 	
	Directory--
 
.-- 
CreateDirectory-- #
(--$ %
directoryExists--& 5
!--5 6
)--7 8
;--8 9
}.. 	
using00 
(00 
var00 
stream00 
=00 
new00  

FileStream00! +
(00, -
completePath00. :
,00: ;
FileMode00< D
.00D E
Create00E K
)00L M
)00N O
{11 	
await22
 
file22 
.22 
CopyToAsync22  
(22! "
stream22# )
)22* +
;22+ ,
}33 	
var55 
image55 
=55 
new55 
	BlogImage55 !
{66 	
Id77
 
=77 
Guid77 
.77 
NewGuid77 
(77 
)77 
,77 
FileName88
 
=88 
sanitizedFileName88 &
,88& '
FileExtension99
 
=99 
	extension99 #
,99# $
Title::
 
=:: 
sanitizedFileName:: #
,::# $
Url;;
 
=;; 
relPath;; 
.;; 
Replace;; 
(;;  
$str;;  $
,;;$ %
$str;;& )
);;) *
,;;* +
DateCreated<<
 
=<< 
DateTime<<  
.<<  !
UtcNow<<! '
}== 	
;==	 

_context>> 
.>> 

BlogImages>> 
.>> 
Add>> 
(>>  !
image>>" '
)>>( )
;>>) *
_contextBB 
.BB 

BlogImagesBB 
.BB 
AddBB 
(BB  !
imageBB" '
)BB( )
;BB) *
tryCC 
{DD 	
awaitEE
 
_contextEE 
.EE 
SaveChangesAsyncEE )
(EE* +
)EE, -
;EE- .
}FF 	
catchGG 
(GG 
DbUpdateExceptionGG !
dbExGG" &
)GG' (
{HH 	
throwII
 
newII 
	ExceptionII 
(II 
$strII  ;
+II< =
dbExII> B
.IIB C
InnerExceptionIIC Q
?IIQ R
.IIR S
MessageIIS Z
,IIZ [
dbExII\ `
)IIa b
;IIb c
}JJ 	
returnLL 
imageLL 
;LL 
}OO 
throwPP 
newPP 
ArgumentExceptionPP !
(PP" #
$strPP$ 9
)PP: ;
;PP; <
}QQ 
}RR 
}SS §6
pC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Repositories\Implementation\FavoriteRepository.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Repositories $
.$ %
Implementation% 3
{ 
public		 
class			 
FavoriteRepository		 !
:		" #
IFavoriteRepository		$ 7
{

 
private 
readonly 
ApplicationContext '
_applicationContext( ;
;; <
public 

FavoriteRepository 
( 
ApplicationContext 0
applicationContext1 C
)C D
{ 
_applicationContext 
= 
applicationContext .
;. /
} 
public 

async 
Task 
< 
FavoritePostDto %
?% &
>& '
AddToFavoritesAsync( ;
(< =
string> D
userIdE K
,K L
GuidM Q
postIdR X
)Y Z
{ 
var 	
alreadyExists
 
= 
await 
_applicationContext  3
.3 4
FavoritePosts4 A
. 	
AnyAsync	 
( 
x 
=> 
x 
. 
UserId 
==  "
userId# )
&&* ,
x- .
.. /

BlogPostId/ 9
==: <
postId= C
)C D
;D E
if 
(	 

alreadyExists 
) 
return !
null" &
;& '
var 	
favorite
 
= 
new 
FavoritePost %
{ 
Id 

= 
Guid 
. 
NewGuid 
( 
) 
, 
UserId 
= 
userId 
, 

BlogPostId 
= 
postId 
, 
FavoritedAt 
= 
DateTime 
. 
UtcNow %
} 
; 
await   
_applicationContext   
.    
FavoritePosts    -
.  - .
AddAsync  . 6
(  7 8
favorite  9 A
)  B C
;  C D
await!! 
_applicationContext!! 
.!!  
SaveChangesAsync!!  0
(!!1 2
)!!3 4
;!!4 5
var## 	
loaded##
 
=## 
await## 
_applicationContext## ,
.##, -
FavoritePosts##- :
.$$ 	
Include$$	 
($$ 
x$$ 
=>$$ 
x$$ 
.$$ 
BlogPost$$  
)$$  !
.%% 	
ThenInclude%%	 
(%% 
x%% 
=>%% 
x%% 
.%% 
AuthorProfile%% )
)%%) *
.&& 	
FirstOrDefaultAsync&&	 
(&& 
x&& 
=>&& !
x&&" #
.&&# $
Id&&$ &
==&&' )
favorite&&* 2
.&&2 3
Id&&3 5
)&&5 6
;&&6 7
return(( 
loaded(( 
!=(( 
null(( 
?(( 
FavoritePostMapper(( 0
.((0 1
ToDto((1 6
(((7 8
loaded((9 ?
)((@ A
:((B C
null((D H
;((H I
}** 
public,, 

async,, 
Task,, 
<,, 
IEnumerable,, !
<,,! "
FavoritePostDto,," 1
>,,1 2
>,,2 3"
GetFavoriteByUserAsync,,4 J
(,,K L
string,,M S
userId,,T Z
),,[ \
{-- 
var.. 	
	favorites..
 
=.. 
await.. 
_applicationContext.. /
.../ 0
FavoritePosts..0 =
.// 	
Where//	 
(// 
x// 
=>// 
x// 
.// 
UserId// 
==// 
userId//  &
)//' (
.00 	
Include00	 
(00 
x00 
=>00 
x00 
.00 
BlogPost00  
)00  !
.11 	
ThenInclude11	 
(11 
x11 
=>11 
x11 
.11 
AuthorProfile11 )
)11) *
.11* +
ThenInclude22 
(22 
x22 
=>22 
x22 
.22 
Image22 
)22  
.33
 
ToListAsync33 
(33 
)33 
;33 
return55 
	favorites55 
.55 
Select55 
(55 
FavoritePostMapper55 1
.551 2
ToDto552 7
)558 9
;559 :
}66 
public:: 

async:: 
Task:: 
<:: 
bool:: 
>:: &
IsPostFavoritedByUserAsync:: 6
(::7 8
string::9 ?
userId::@ F
,::F G
Guid::H L
postId::M S
)::T U
{;; 
return<< 
await<< 
_applicationContext<< &
.<<& '
FavoritePosts<<' 4
.== 	
AnyAsync==	 
(== 
x== 
=>== 
x== 
.== 
UserId== !
====" $
userId==% +
&&==, .
x==/ 0
.==0 1

BlogPostId==1 ;
====< >
postId==? E
)==F G
;==G H
}>> 
public@@ 

async@@ 
Task@@ 
<@@ 
bool@@ 
>@@ $
RemoveFromFavoritesAsync@@ 4
(@@5 6
string@@7 =
userId@@> D
,@@D E
Guid@@F J
postId@@K Q
)@@R S
{AA 
varBB 	
favoriteBB
 
=BB 
awaitBB 
_applicationContextBB -
.BB- .
FavoritePostsBB. ;
.CC 	
FirstOrDefaultAsyncCC	 
(CC 
xCC  
=>CC! #
xCC$ %
.CC% &
UserIdCC& ,
==CC- /
userIdCC0 6
&&CC7 9
xCC: ;
.CC; <

BlogPostIdCC< F
==CCG I
postIdCCJ P
)CCQ R
;CCR S
ifEE 
(EE	 

favoriteEE 
==EE 
nullEE 
)EE 
returnEE $
falseEE% *
;EE+ ,
_applicationContextFF 
.FF 
FavoritePostsFF '
.FF' (
RemoveFF( .
(FF/ 0
favoriteFF1 9
)FF: ;
;FF; <
varGG 	
resultGG
 
=GG 
_applicationContextGG &
.GG& '
SaveChangesAsyncGG' 7
(GG8 9
)GG: ;
;GG; <
returnHH 
trueHH 
;HH 
}II 
}LL 
}MM Ó=
pC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Repositories\Implementation\CategoryRepository.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Repositories $
.$ %
Implementation% 3
{ 
public 
class	 
CategoryRepository !
:" #
ICategoryRepository$ 7
{		 
private

 
readonly

 
ApplicationContext

 '

_dbContext

( 2
;

2 3
public 

CategoryRepository 
( 
ApplicationContext 0
	dbContext1 :
): ;
{ 

_dbContext 
= 
	dbContext 
; 
} 
public 

async 
Task 
< 
Category 
> 
CreateAsync  +
(+ ,
Category, 4
category5 =
)= >
{ 
await 

_dbContext 
. 

Categories #
.# $
AddAsync$ ,
(, -
category- 5
)5 6
;6 7
await 

_dbContext 
. 
SaveChangesAsync )
() *
)* +
;+ ,
return 
category 
; 
} 
public 

async 
Task 
< 
IEnumerable !
<! "
Category" *
>* +
>+ ,
GetAllCategories- =
(= >
string> D
?D E
queryF K
=L M
nullN R
, 
string 
? 
sortBy 
= 
null 
, 
string %
?% &
sortDirection' 4
=5 6
null7 ;
,; <
int= @
?@ A

pageNumberB L
=M N
$numO P
,P Q
intR U
?U V
pageSizeW _
=` a
$numb e
)f g
{ 
var 	

categories
 
= 

_dbContext !
.! "

Categories" ,
., -
AsQueryable- 8
(8 9
)9 :
;: ;
if!! 	
(!!	 

string!!
 
.!! 
IsNullOrWhiteSpace!! #
(!!# $
query!!$ )
)!!) *
==!!+ -
false!!. 3
)!!4 5
{"" 

categories## 
=## 

categories## 
.##  
Where##  %
(##% &
x##& '
=>##( *
x##+ ,
.##, -
Name##- 1
.##1 2
Contains##2 :
(##: ;
query##; @
)##@ A
)##A B
;##B C
}%% 
if(( 
((( 	
string((	 
.(( 
IsNullOrEmpty(( 
((( 
sortBy(( $
)(($ %
==((% '
false((( -
)((. /
{)) 
if** 

(**
 
string** 
.** 
Equals** 
(** 
sortBy** 
,**  
$str**! '
,**' (
StringComparison**) 9
.**9 :
OrdinalIgnoreCase**: K
)**L M
)**N O
{++ 	
var,, 
isAsc,, 
=,, 
string,, 
.,, 
Equals,, %
(,,% &
sortDirection,,& 3
,,,3 4
$str,,5 :
,,,: ;
StringComparison,,< L
.,,L M
OrdinalIgnoreCase,,M ^
),,^ _
;,,` a

categories--
 
=-- 
isAsc-- 
?-- 

categories-- )
.--) *
OrderBy--* 1
(--1 2
x--2 3
=>--4 6
x--7 8
.--8 9
Name--9 =
)--= >
:--? @

categories.. 
... 
OrderByDescending.. (
(..( )
x..) *
=>..+ -
x... /
.../ 0
Name..0 4
)..4 5
;..5 6
}// 	
}00 
var66 	
skipResults66
 
=66 
(66 

pageNumber66 #
-66$ %
$num66& '
)66' (
*66) *
pageSize66+ 3
;663 4

categories77 
=77 

categories77 
.77 
Skip77 "
(77" #
skipResults77# .
??77/ 1
$num772 3
)773 4
.774 5
Take775 9
(779 :
pageSize77: B
??77C E
$num77F I
)77I J
;77J K
return== 
await== 

categories== 
.== 
ToListAsync== )
(==) *
)==* +
;==+ ,
}>> 
publicCC 

asyncCC 
TaskCC 
<CC 
CategoryCC 
?CC 
>CC   
GetCategoryByIdAsyncCC! 5
(CC5 6
GuidCC6 :
idCC; =
)CC= >
{DD 
returnEE 
awaitEE 

_dbContextEE 
.EE 

CategoriesEE (
.EE( )
	FindAsyncEE) 2
(EE2 3
idEE3 5
)EE5 6
;EE6 7
}FF 
publicHH 

asyncHH 
TaskHH 
<HH 
CategoryHH 
?HH 
>HH  
UpdateCategoryAsyncHH! 4
(HH4 5
CategoryHH5 =
categoryHH> F
)HHF G
{II 
varJJ 	
existingCategoryJJ
 
=JJ 
awaitJJ "

_dbContextJJ# -
.JJ- .

CategoriesJJ. 8
.JJ8 9
	FindAsyncJJ9 B
(JJB C
categoryJJC K
.JJK L
IdJJL N
)JJN O
;JJO P
ifLL 
(LL 	
existingCategoryLL	 
!=LL 
nullLL !
)LL! "
{MM 

_dbContextNN 
.NN 
EntryNN 
(NN 
existingCategoryNN )
)NN) *
.NN* +
CurrentValuesNN+ 8
.NN8 9
	SetValuesNN9 B
(NNB C
categoryNNC K
)NNK L
;NNL M
awaitOO 

_dbContextOO 
.OO 
SaveChangesAsyncOO )
(OO) *
)OO* +
;OO+ ,
returnPP 
categoryPP 
;PP 
}QQ 
returnSS 
nullSS 
;SS 
}UU 
publicYY 

asyncYY 
TaskYY 
<YY 
CategoryYY 
?YY 
>YY  
DeleteCategoryAsyncYY! 4
(YY4 5
GuidYY5 9
idYY: <
)YY< =
{ZZ 
var[[ 	
category[[
 
=[[ 
await[[ 

_dbContext[[ %
.[[% &

Categories[[& 0
.[[0 1
	FindAsync[[1 :
([[: ;
id[[; =
)[[= >
;[[> ?
if\\ 
(\\	 

category\\
 
==\\ 
null\\ 
)\\ 
{]] 
return^^ 
null^^ 
;^^ 
}__ 

_dbContext`` 
.`` 

Categories`` 
.`` 
Remove`` #
(``# $
category``$ ,
)``, -
;``- .
awaitaa 

_dbContextaa 
.aa 
SaveChangesAsyncaa (
(aa( )
)aa) *
;aa* +
returnbb 
categorybb 
;bb 
}dd 
publicff 

asyncff 
Taskff 
<ff 
intff 
>ff #
GetCategoriesCountAsyncff 2
(ff3 4
)ff5 6
{gg 
returnhh 
awaithh 

_dbContexthh 
.hh 

Categorieshh (
.hh( )

CountAsynchh) 3
(hh3 4
)hh4 5
;hh5 6
}jj 
}kk 
}ll †ƒ
pC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Repositories\Implementation\BlogPostRepository.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Repositories $
.$ %
Implementation% 3
{		 
public

 
class

	 
BlogPostRepository

 !
:

" #
IBlogPostRepository

$ 7
{ 
private 
readonly 
ApplicationContext '
_context( 0
;0 1
private 
readonly 
ILogger 
< 
BlogPostRepository /
>/ 0
_logger1 8
;8 9
public 

BlogPostRepository 
( 
ApplicationContext 0
context1 8
,8 9
ILogger: A
<A B
BlogPostRepositoryB T
>T U
loggerV \
)\ ]
{ 
_context 
= 
context 
; 
_logger 
= 
logger 
; 
} 
public 

async 
Task 
< 
BlogPost 
> 
CreateBlogPostAsync  3
(3 4
BlogPost4 <
blogPost= E
)E F
{ 
await 
_context 
. 
	BlogPosts 
. 
AddAsync '
(' (
blogPost( 0
)0 1
;1 2
await 
_context 
. 
SaveChangesAsync %
(% &
)& '
;' (
return 
blogPost 
; 
} 
public 

async 
Task 
< 
IEnumerable !
<! "
BlogPost" *
>* +
>+ ,
GetAllAsync- 8
(8 9
string 
? 
query 
= 
null 
, 
string 
? 
sortBy 
= 
null 
, 
string 
? 
sortDirection 
= 
null "
," #
int   	
?  	 


pageNumber   
=   
$num   
,   
int!! 	
?!!	 

pageSize!! 
=!! 
$num!! 
)!! 
{"" 
var## 	
	blogPosts##
 
=## 
_context## 
.## 
	BlogPosts## (
.$$ 	
Include$$	 
($$ 
bp$$ 
=>$$ 
bp$$ 
.$$ 

Categories$$ $
)$$$ %
.%% 	
Include%%	 
(%% 
bp%% 
=>%% 
bp%% 
.%% 
AuthorProfile%% '
)%%' (
.&& 	
ThenInclude&&	 
(&& 
x&& 
=>&& 
x&& 
.&& 
Image&& !
)&&! "
.'' 	
AsQueryable''	 
('' 
)'' 
;'' 
if)) 
())	 

!))
 
string)) 
.)) 
IsNullOrEmpty)) 
())  
query))  %
)))% &
)))& '
{** 
	blogPosts++ 
=++ 
	blogPosts++ 
.++ 
Where++ #
(++# $
x++$ %
=>++& (
x,, 
.,, 
Title,, 
.,, 
Contains,, 
(,, 
query,, "
),," #
||,,$ &
x-- 
.-- 
Content-- 
.-- 
Contains-- 
(-- 
query-- $
)--$ %
||--& (
x.. 
... 
ShortDescription.. 
... 
Contains.. '
(..' (
query..( -
)..- .
||../ 1
x// 
.// 
AuthorProfile// 
.// 
UserName// $
.//$ %
Contains//% -
(//- .
query//. 3
)//3 4
)//4 5
;//5 6
}00 
if22 
(22	 

!22
 
string22 
.22 
IsNullOrEmpty22 
(22  
sortBy22  &
)22& '
)22' (
{33 
var44 
isAsc44 
=44 
string44 
.44 
Equals44 !
(44! "
sortDirection44" /
,44/ 0
$str441 6
,446 7
StringComparison448 H
.44H I
OrdinalIgnoreCase44I Z
)44Z [
;44[ \
if66 

(66 
string66 
.66 
Equals66 
(66 
sortBy66  
,66  !
$str66" *
,66* +
StringComparison66, <
.66< =
OrdinalIgnoreCase66= N
)66N O
)66O P
{77 	
	blogPosts88
 
=88 
isAsc88 
?99 
	blogPosts99 
.99 
OrderBy99 !
(99! "
x99" #
=>99$ &
x99' (
.99( )
AuthorProfile99) 6
.996 7
UserName997 ?
)99? @
::: 
	blogPosts:: 
.:: 
OrderByDescending:: +
(::+ ,
x::, -
=>::. 0
x::1 2
.::2 3
AuthorProfile::3 @
.::@ A
UserName::A I
)::I J
;::J K
};; 	
else<< 
if<< 
(<< 
string<< 
.<< 
Equals<< 
(<< 
sortBy<< %
,<<% &
$str<<' 6
,<<6 7
StringComparison<<8 H
.<<H I
OrdinalIgnoreCase<<I Z
)<<Z [
)<<[ \
{== 	
	blogPosts>>
 
=>> 
isAsc>> 
??? 
	blogPosts?? 
.?? 
OrderBy?? !
(??! "
x??" #
=>??$ &
x??' (
.??( )
PublishedDate??) 6
)??6 7
:@@ 
	blogPosts@@ 
.@@ 
OrderByDescending@@ +
(@@+ ,
x@@, -
=>@@. 0
x@@1 2
.@@2 3
PublishedDate@@3 @
)@@@ A
;@@A B
}AA 	
}BB 
varDD 	
skipResultsDD
 
=DD 
(DD 

pageNumberDD #
-DD$ %
$numDD& '
)DD' (
*DD) *
pageSizeDD+ 3
??DD4 6
$numDD7 8
;DD8 9
	blogPostsEE 
=EE 
	blogPostsEE 
.EE 
SkipEE  
(EE  !
skipResultsEE! ,
)EE, -
.EE- .
TakeEE. 2
(EE2 3
pageSizeEE3 ;
??EE< >
$numEE? B
)EEB C
;EEC D
varGG 	
postsGG
 
=GG 
awaitGG 
	blogPostsGG "
.GG" #
ToListAsyncGG# .
(GG. /
)GG/ 0
;GG0 1
foreachHH 
(HH 
varHH 
postHH 
inHH 
postsHH  
)HH  !
{II 
_loggerJJ 
.JJ 
LogInformationJJ 
(JJ 
$"JJ 
$strJJ #
{JJ# $
postJJ$ (
.JJ( )
TitleJJ) .
}JJ. /
$strJJ/ 9
{JJ9 :
postJJ: >
.JJ> ?
AuthorProfileJJ? L
?JJL M
.JJM N
UserNameJJN V
}JJV W
$strJJW a
{JJa b
postJJb f
.JJf g
AuthorProfileJJg t
?JJt u
.JJu v
ImageIdJJv }
}JJ} ~
$str	JJ~ â
{
JJâ ä
post
JJä é
.
JJé è
AuthorProfile
JJè ú
?
JJú ù
.
JJù û
Image
JJû £
?
JJ£ §
.
JJ§ •
Url
JJ• ®
}
JJ® ©
"
JJ© ™
)
JJ™ ´
;
JJ´ ¨
}KK 
returnMM 
postsMM 
;MM 
}OO 
publicQQ 

asyncQQ 
TaskQQ 
<QQ 
BlogPostQQ 
?QQ 
>QQ   
GetBlogPostByIdAsyncQQ! 5
(QQ5 6
GuidQQ6 :
idQQ; =
)QQ= >
{RR 
returnSS 
awaitSS 
_contextSS 
.SS 
	BlogPostsSS %
.TT 	
IncludeTT	 
(TT 
xTT 
=>TT 
xTT 
.TT 

CategoriesTT "
)TT" #
.UU 	
IncludeUU	 
(UU 
xUU 
=>UU 
xUU 
.UU 
AuthorProfileUU %
)UU% &
.VV 	
ThenIncludeVV	 
(VV 
xVV 
=>VV 
xVV 
.VV 
ImageVV !
)VV! "
.WW 	
FirstOrDefaultAsyncWW	 
(WW 
bpWW 
=>WW  "
bpWW# %
.WW% &
IdWW& (
==WW) +
idWW, .
)WW. /
;WW/ 0
}XX 
publicZZ 

asyncZZ 
TaskZZ 
<ZZ 
IEnumerableZZ !
<ZZ! "
BlogPostZZ" *
>ZZ* +
>ZZ+ , 
GetRelatedPostsAsyncZZ- A
(ZZA B
GuidZZB F
postIdZZG M
)ZZM N
{[[ 
var\\ 
currentPost\\ 
=\\ 
await\\ 
_context\\ $
.\\$ %
	BlogPosts\\% .
.]] 	
Include]]	 
(]] 
p]] 
=>]] 
p]] 
.]] 

Categories]] "
)]]" #
.^^ 	
FirstOrDefaultAsync^^	 
(^^ 
p^^ 
=>^^ !
p^^" #
.^^# $
Id^^$ &
==^^' )
postId^^* 0
)^^0 1
;^^1 2
if`` 
(`` 
currentPost`` 
==`` 
null`` 
||`` 
currentPost`` *
.``* +

Categories``+ 5
==``6 8
null``9 =
||``> @
!``A B
currentPost``B M
.``M N

Categories``N X
.``X Y
Any``Y \
(``\ ]
)``] ^
)``^ _
returnaa 

Enumerableaa 
.aa 
Emptyaa 
<aa  
BlogPostaa  (
>aa( )
(aa) *
)aa* +
;aa+ ,
varcc 
categoryIdscc 
=cc 
currentPostcc !
.cc! "

Categoriescc" ,
.cc, -
Selectcc- 3
(cc3 4
ccc4 5
=>cc6 8
ccc9 :
.cc: ;
Idcc; =
)cc= >
.cc> ?
ToListcc? E
(ccE F
)ccF G
;ccG H
returnee 

awaitee 
_contextee 
.ee 
	BlogPostsee #
.ff 	
Includeff	 
(ff 
pff 
=>ff 
pff 
.ff 

Categoriesff "
)ff" #
.gg 	
Includegg	 
(gg 
pgg 
=>gg 
pgg 
.gg 
AuthorProfilegg %
)gg% &
.hh 	
Wherehh	 
(hh 
phh 
=>hh 
phh 
.hh 
Idhh 
!=hh 
postIdhh "
&&hh# %
pii 
.ii 

Categoriesii  
.ii  !
Anyii! $
(ii$ %
cii% &
=>ii' )
categoryIdsii* 5
.ii5 6
Containsii6 >
(ii> ?
cii? @
.ii@ A
IdiiA C
)iiC D
)iiD E
&&iiF H
pjj 
.jj 
	IsVisiblejj 
)jj  
.kk 	
OrderByDescendingkk	 
(kk 
pkk 
=>kk 
pkk  !
.kk! "
PublishedDatekk" /
)kk/ 0
.ll 	
Takell	 
(ll 
$numll 
)ll 
.mm 	
ToListAsyncmm	 
(mm 
)mm 
;mm 
}nn 
publicpp 

asyncpp 
Taskpp 
<pp 
BlogPostpp 
?pp 
>pp  
UpdateBlogPostAsyncpp! 4
(pp4 5
BlogPostpp5 =
blogPostpp> F
)ppF G
{qq 
varrr 	
existingPostrr
 
=rr 
awaitrr 
_contextrr '
.rr' (
	BlogPostsrr( 1
.ss 	
Includess	 
(ss 
bpss 
=>ss 
bpss 
.ss 

Categoriesss $
)ss$ %
.tt 	
Includett	 
(tt 
bptt 
=>tt 
bptt 
.tt 
AuthorProfilett '
)tt' (
.uu 	
FirstOrDefaultAsyncuu	 
(uu 
bpuu 
=>uu  "
bpuu# %
.uu% &
Iduu& (
==uu) +
blogPostuu, 4
.uu4 5
Iduu5 7
)uu7 8
;uu8 9
ifww 
(ww	 

existingPostww
 
==ww 
nullww 
)ww 
returnxx 
nullxx 
;xx 
_contextzz 
.zz 
Entryzz 
(zz 
existingPostzz !
)zz! "
.zz" #
CurrentValueszz# 0
.zz0 1
	SetValueszz1 :
(zz: ;
blogPostzz; C
)zzC D
;zzD E
var|| 	
categoryIds||
 
=|| 
blogPost||  
.||  !

Categories||! +
.||+ ,
Select||, 2
(||2 3
x||3 4
=>||5 7
x||8 9
.||9 :
Id||: <
)||< =
.||= >
ToList||> D
(||D E
)||E F
;||F G
var}} 	

categories}}
 
=}} 
await}} 
_context}} %
.}}% &

Categories}}& 0
.~~ 	
Where~~	 
(~~ 
c~~ 
=>~~ 
categoryIds~~ 
.~~  
Contains~~  (
(~~( )
c~~) *
.~~* +
Id~~+ -
)~~- .
)~~. /
. 	
ToListAsync	 
( 
) 
; 
existingPost
ÅÅ 
.
ÅÅ 

Categories
ÅÅ 
.
ÅÅ 
Clear
ÅÅ #
(
ÅÅ# $
)
ÅÅ$ %
;
ÅÅ% &
existingPost
ÇÇ 
.
ÇÇ 

Categories
ÇÇ 
.
ÇÇ 
AddRange
ÇÇ &
(
ÇÇ& '

categories
ÇÇ' 1
)
ÇÇ1 2
;
ÇÇ2 3
await
ÑÑ 
_context
ÑÑ 
.
ÑÑ 
SaveChangesAsync
ÑÑ %
(
ÑÑ% &
)
ÑÑ& '
;
ÑÑ' (
return
ÖÖ 
existingPost
ÖÖ 
;
ÖÖ 
}
ÜÜ 
public
àà 

async
àà 
Task
àà 
<
àà 
BlogPost
àà 
?
àà 
>
àà  !
DeleteBlogPostAsync
àà! 4
(
àà4 5
Guid
àà5 9
id
àà: <
)
àà< =
{
ââ 
var
ää 	
blogPost
ää
 
=
ää 
await
ää 
_context
ää #
.
ää# $
	BlogPosts
ää$ -
.
ää- .!
FirstOrDefaultAsync
ää. A
(
ääA B
bp
ääB D
=>
ääE G
bp
ääH J
.
ääJ K
Id
ääK M
==
ääN P
id
ääQ S
)
ääS T
;
ääT U
if
ãã 
(
ãã	 

blogPost
ãã
 
==
ãã 
null
ãã 
)
ãã 
return
åå 
null
åå 
;
åå 
_context
éé 
.
éé 
	BlogPosts
éé 
.
éé 
Remove
éé 
(
éé  
blogPost
éé  (
)
éé( )
;
éé) *
await
èè 
_context
èè 
.
èè 
SaveChangesAsync
èè %
(
èè% &
)
èè& '
;
èè' (
return
êê 
blogPost
êê 
;
êê 
}
ëë 
public
ìì 

async
ìì 
Task
ìì 
<
ìì 
BlogPost
ìì 
?
ìì 
>
ìì  $
GetBlogPostByUrlHandle
ìì! 7
(
ìì7 8
string
ìì8 >
	urlhandle
ìì? H
)
ììH I
{
îî 
return
ïï 
await
ïï 
_context
ïï 
.
ïï 
	BlogPosts
ïï %
.
ññ 	
Include
ññ	 
(
ññ 
x
ññ 
=>
ññ 
x
ññ 
.
ññ 

Categories
ññ "
)
ññ" #
.
óó 	
Include
óó	 
(
óó 
x
óó 
=>
óó 
x
óó 
.
óó 
AuthorProfile
óó %
)
óó% &
.
óó& '
ThenInclude
óó' 2
(
óó2 3
x
óó3 4
=>
óó5 7
x
óó8 9
.
óó9 :
Image
óó: ?
)
óó? @
.
òò 	!
FirstOrDefaultAsync
òò	 
(
òò 
bp
òò 
=>
òò  "
bp
òò# %
.
òò% &
	UrlHandle
òò& /
==
òò0 2
	urlhandle
òò3 <
)
òò< =
;
òò= >
}
ôô 
public
õõ 

async
õõ 
Task
õõ 
<
õõ 
int
õõ 
>
õõ $
GetBlogPostsCountAsync
õõ 1
(
õõ1 2
)
õõ2 3
{
úú 
return
ùù 
await
ùù 
_context
ùù 
.
ùù 
	BlogPosts
ùù %
.
ùù% &

CountAsync
ùù& 0
(
ùù0 1
)
ùù1 2
;
ùù2 3
}
ûû 
public
†† 

async
†† 
Task
†† 
<
†† 
IEnumerable
†† !
<
††! "
BlogPost
††" *
>
††* +
>
††+ ,
GetPopularPosts
††- <
(
††< =
int
††= @
count
††A F
=
††G H
$num
††I J
)
††J K
{
°° 
return
¢¢ 
await
¢¢ 
_context
¢¢ 
.
¢¢ 
	BlogPosts
¢¢ %
.
££ 	
Include
££	 
(
££ 
x
££ 
=>
££ 
x
££ 
.
££ 

Categories
££ "
)
££" #
.
§§ 	
Include
§§	 
(
§§ 
x
§§ 
=>
§§ 
x
§§ 
.
§§ 
AuthorProfile
§§ %
)
§§% &
.
•• 	
Where
••	 
(
•• 
x
•• 
=>
•• 
x
•• 
.
•• 
	IsVisible
•• 
&&
••  "
x
••# $
.
••$ %
AuthorProfile
••% 2
!=
••3 5
null
••6 :
)
••: ;
.
¶¶ 	
Select
¶¶	 
(
¶¶ 
x
¶¶ 
=>
¶¶ 
new
¶¶ 
BlogPost
¶¶ !
{
ßß 	
Id
®® 
=
®® 
x
®® 
.
®® 
Id
®® 
,
®® 
Title
©© 
=
©© 
x
©© 
.
©© 
Title
©© 
,
©© 
ShortDescription
™™ 
=
™™ 
x
™™  
.
™™  !
ShortDescription
™™! 1
,
™™1 2
Content
´´ 
=
´´ 
x
´´ 
.
´´ 
Content
´´ 
,
´´  
FeaturedImageUrl
¨¨ 
=
¨¨ 
x
¨¨  
.
¨¨  !
FeaturedImageUrl
¨¨! 1
,
¨¨1 2
	UrlHandle
≠≠ 
=
≠≠ 
x
≠≠ 
.
≠≠ 
	UrlHandle
≠≠ #
,
≠≠# $
PublishedDate
ÆÆ 
=
ÆÆ 
x
ÆÆ 
.
ÆÆ 
PublishedDate
ÆÆ +
,
ÆÆ+ ,
	IsVisible
ØØ 
=
ØØ 
x
ØØ 
.
ØØ 
	IsVisible
ØØ #
,
ØØ# $
	ViewCount
∞∞ 
=
∞∞ 
x
∞∞ 
.
∞∞ 
	ViewCount
∞∞ #
,
∞∞# $
AuthorId
±± 
=
±± 
x
±± 
.
±± 
AuthorId
±± !
,
±±! "
AuthorProfile
≤≤ 
=
≤≤ 
new
≤≤ 
UserProfile
≤≤  +
{
≥≥ 
Id
¥¥ 
=
¥¥ 
x
¥¥ 
.
¥¥ 
AuthorProfile
¥¥ $
.
¥¥$ %
Id
¥¥% '
,
¥¥' (
UserName
µµ 
=
µµ 
x
µµ 
.
µµ 
AuthorProfile
µµ *
.
µµ* +
UserName
µµ+ 3
,
µµ3 4
FullName
∂∂ 
=
∂∂ 
x
∂∂ 
.
∂∂ 
AuthorProfile
∂∂ *
.
∂∂* +
FullName
∂∂+ 3
,
∂∂3 4
Bio
∑∑ 
=
∑∑ 
x
∑∑ 
.
∑∑ 
AuthorProfile
∑∑ %
.
∑∑% &
Bio
∑∑& )
,
∑∑) *
	Interests
∏∏ 
=
∏∏ 
x
∏∏ 
.
∏∏ 
AuthorProfile
∏∏ +
.
∏∏+ ,
	Interests
∏∏, 5
,
∏∏5 6
Image
ππ 
=
ππ 
x
ππ 
.
ππ 
AuthorProfile
ππ (
.
ππ( )
Image
ππ) .
,
ππ. /
ImageId
∫∫ 
=
∫∫ 
x
∫∫ 
.
∫∫ 
AuthorProfile
∫∫ *
.
∫∫* +
ImageId
∫∫+ 2
}
ªª 
,
ªª 

Categories
ºº 
=
ºº 
x
ºº 
.
ºº 

Categories
ºº %
.
ºº% &
Select
ºº& ,
(
ºº, -
c
ºº- .
=>
ºº/ 1
new
ºº2 5
Category
ºº6 >
{
ΩΩ 
Id
ææ 
=
ææ 
c
ææ 
.
ææ 
Id
ææ 
,
ææ 
Name
øø 
=
øø 
c
øø 
.
øø 
Name
øø 
,
øø 
	UrlHandle
¿¿ 
=
¿¿ 
c
¿¿ 
.
¿¿ 
	UrlHandle
¿¿ '
}
¡¡ 
)
¡¡ 
.
¡¡ 
ToList
¡¡ 
(
¡¡ 
)
¡¡ 
}
¬¬ 	
)
¬¬	 

.
√√ 	
OrderByDescending
√√	 
(
√√ 
x
√√ 
=>
√√ 
x
√√  !
.
√√! "
	ViewCount
√√" +
)
√√+ ,
.
ƒƒ 	
Take
ƒƒ	 
(
ƒƒ 
count
ƒƒ 
)
ƒƒ 
.
≈≈ 	
ToListAsync
≈≈	 
(
≈≈ 
)
≈≈ 
;
≈≈ 
}
∆∆ 
public
»» 

async
»» 
Task
»» 
<
»» 
IEnumerable
»» !
<
»»! "
BlogPost
»»" *
>
»»* +
>
»»+ ,"
GetPostByAuthorAsync
»»- A
(
»»A B
string
»»B H
authorId
»»I Q
)
»»Q R
{
…… 
return
   
await
   
_context
   
.
   
	BlogPosts
   %
.
ÀÀ 	
Include
ÀÀ	 
(
ÀÀ 
x
ÀÀ 
=>
ÀÀ 
x
ÀÀ 
.
ÀÀ 

Categories
ÀÀ "
)
ÀÀ" #
.
ÃÃ 	
Include
ÃÃ	 
(
ÃÃ 
x
ÃÃ 
=>
ÃÃ 
x
ÃÃ 
.
ÃÃ 
AuthorProfile
ÃÃ %
)
ÃÃ% &
.
ÃÃ& '
ThenInclude
ÃÃ' 2
(
ÃÃ2 3
x
ÃÃ3 4
=>
ÃÃ5 7
x
ÃÃ8 9
.
ÃÃ9 :
Image
ÃÃ: ?
)
ÃÃ? @
.
ÕÕ 	
Where
ÕÕ	 
(
ÕÕ 
x
ÕÕ 
=>
ÕÕ 
x
ÕÕ 
.
ÕÕ 
AuthorId
ÕÕ 
==
ÕÕ !
authorId
ÕÕ" *
)
ÕÕ* +
.
ŒŒ 	
ToListAsync
ŒŒ	 
(
ŒŒ 
)
ŒŒ 
;
ŒŒ 
}
œœ 
public
—— 

async
—— 
Task
—— 
<
—— 
IEnumerable
—— !
<
——! "
BlogPost
——" *
>
——* +
>
——+ ,*
GetPopularPostsByAuthorAsync
——- I
(
——I J
string
——J P
authorId
——Q Y
,
——Y Z
int
——[ ^
count
——_ d
=
——e f
$num
——g h
)
——h i
{““ 
return
”” 

await
”” 
_context
”” 
.
”” 
	BlogPosts
”” #
.
‘‘ 	
Where
‘‘	 
(
‘‘ 
p
‘‘ 
=>
‘‘ 
p
‘‘ 
.
‘‘ 
AuthorId
‘‘ 
==
‘‘ !
authorId
‘‘" *
)
‘‘* +
.
’’ 	
OrderByDescending
’’	 
(
’’ 
p
’’ 
=>
’’ 
p
’’  !
.
’’! "
	ViewCount
’’" +
)
’’+ ,
.
÷÷ 	
Take
÷÷	 
(
÷÷ 
count
÷÷ 
)
÷÷ 
.
◊◊ 	
Include
◊◊	 
(
◊◊ 
p
◊◊ 
=>
◊◊ 
p
◊◊ 
.
◊◊ 

Categories
◊◊ "
)
◊◊" #
.
ÿÿ 	
Include
ÿÿ	 
(
ÿÿ 
p
ÿÿ 
=>
ÿÿ 
p
ÿÿ 
.
ÿÿ 
AuthorProfile
ÿÿ %
)
ÿÿ% &
.
ÿÿ& '
ThenInclude
ÿÿ' 2
(
ÿÿ2 3
a
ÿÿ3 4
=>
ÿÿ5 7
a
ÿÿ8 9
.
ÿÿ9 :
Image
ÿÿ: ?
)
ÿÿ? @
.
ŸŸ 	
ToListAsync
ŸŸ	 
(
ŸŸ 
)
ŸŸ 
;
ŸŸ 
}⁄⁄ 
}
‹‹ 
}›› Ü=
IC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder

 
.

 
Services

 
.

 "
AddApplicationServices

 '
(

' (
builder

( /
.

/ 0
Configuration

0 =
)

= >
;

> ?
builder 
. 
Services 
. 
AddIdentityService #
(# $
builder$ +
.+ ,
Configuration, 9
)9 :
;: ;
builder 
. 
WebHost 
. 

UseWebRoot 
( 
$str $
)$ %
;% &
builder 
. 
Logging 
. 
ClearProviders 
( 
)  
;  !
builder 
. 
Logging 
. 

AddConsole 
( 
) 
; 
builder 
. 
Logging 
. 
AddDebug 
( 
) 
; 
var 
app 
= 	
builder
 
. 
Build 
( 
) 
; 
if 
( 
app 
. 
Environment 
. 
IsDevelopment !
(! "
)" #
)# $
{ 
app 
. 

UseSwagger 
( 
) 
; 
app 
. 
UseSwaggerUI 
( 
) 
; 
} 
app 
. 
UseHttpsRedirection 
( 
) 
; 
app 
. 
UseCors 
( 
options 
=> 
{ 
options 
. 
AllowAnyHeader 
( 
) 
; 
options 
. 
WithOrigins 
( 
$str /
,/ 0
$str1 I
)I J
;J K
options 
. 
AllowAnyMethod 
( 
) 
; 
options   
.   
AllowCredentials   
(   
)   
;   
}!! 
)!! 
;!! 
app## 
.## 
UseAuthentication## 
(## 
)## 
;## 
app$$ 
.$$ 
UseAuthorization$$ 
($$ 
)$$ 
;$$ 
app%% 
.%% 
UseStaticFiles%% 
(%% 
)%% 
;%% 
app'' 
.'' 
MapControllers'' 
('' 
)'' 
;'' 
using)) 
var)) 	
scopes))
 
=)) 
app)) 
.)) 
Services)) 
.))  
CreateScope))  +
())+ ,
))), -
;))- .
var** 
services** 
=** 
scopes** 
.** 
ServiceProvider** %
;**% &
var++ 
context++ 
=++ 
services++ 
.++ 
GetRequiredService++ )
<++) *
ApplicationContext++* <
>++< =
(++= >
)++> ?
;++? @
var,, 
authContext,, 
=,, 
services,, 
.,, 
GetRequiredService,, -
<,,- .
AuthContext,,. 9
>,,9 :
(,,: ;
),,; <
;,,< =
var-- 
userManager-- 
=-- 
services-- 
.-- 
GetRequiredService-- -
<--- .
UserManager--. 9
<--9 :
UserProfile--: E
>--E F
>--F G
(--G H
)--H I
;--I J
var.. 
roleManager.. 
=.. 
services.. 
... 
GetRequiredService.. -
<..- .
RoleManager... 9
<..9 :
IdentityRole..: F
>..F G
>..G H
(..H I
)..I J
;..J K
var// 
logger// 

=// 
services// 
.// 
GetRequiredService// (
<//( )
ILogger//) 0
<//0 1
Program//1 8
>//8 9
>//9 :
(//: ;
)//; <
;//< =
try11 
{22 
await33 	
context33
 
.33 
Database33 
.33 
MigrateAsync33 '
(33' (
)33( )
;33) *
await44 	
authContext44
 
.44 
Database44 
.44 
MigrateAsync44 +
(44+ ,
)44, -
;44- .
string77 

[77
 
]77 
roles77 
=77 
{77 
$str77 
,77 
$str77  (
,77( )
$str77* 0
}771 2
;772 3
foreach88 
(88 
var88 
role88 
in88 
roles88 
)88 
{99 
if:: 

(:: 
!:: 
await:: 
roleManager:: 
.:: 
RoleExistsAsync:: .
(::. /
role::/ 3
)::3 4
)::4 5
{;; 	
await<< 
roleManager<< 
.<< 
CreateAsync<< )
(<<) *
new<<* -
IdentityRole<<. :
(<<: ;
role<<; ?
)<<? @
)<<@ A
;<<A B
}== 	
}>> 
varAA 
	adminUserAA 
=AA 
awaitAA 
userManagerAA %
.AA% &
FindByEmailAsyncAA& 6
(AA6 7
$strAA7 L
)AAL M
;AAM N
ifBB 
(BB 
	adminUserBB 
==BB 
nullBB 
)BB 
{CC 
	adminUserDD 
=DD 
newDD 
UserProfileDD #
{EE 	
UserNameFF 
=FF 
$strFF ,
,FF, -
EmailGG 
=GG 
$strGG )
,GG) *
FullNameHH 
=HH 
$strHH 
,HH 
EmailConfirmedII 
=II 
trueII !
}JJ 	
;JJ	 

varLL 
resultLL 
=LL 
awaitLL 
userManagerLL &
.LL& '
CreateAsyncLL' 2
(LL2 3
	adminUserLL3 <
,LL< =
$strLL> I
)LLI J
;LLJ K
ifMM 

(MM 
resultMM 
.MM 
	SucceededMM 
)MM 
{NN 	
awaitOO 
userManagerOO 
.OO 
AddToRoleAsyncOO ,
(OO, -
	adminUserOO- 6
,OO6 7
$strOO8 ?
)OO? @
;OO@ A
awaitPP 
userManagerPP 
.PP 
AddToRoleAsyncPP ,
(PP, -
	adminUserPP- 6
,PP6 7
$strPP8 @
)PP@ A
;PPA B
}QQ 	
}RR 
awaitTT 	"
ApplicationContextSeedTT
  
.TT  !
	SeedAsyncTT! *
(TT* +
contextTT+ 2
,TT2 3
userManagerTT4 ?
)TT? @
;TT@ A
}UU 
catchVV 
(VV 
	ExceptionVV 
errVV 
)VV 
{WW 
loggerXX 

.XX
 
LogErrorXX 
(XX 
errXX 
,XX 
$strXX <
)XX< =
;XX= >
}YY 
app[[ 
.[[ 
Run[[ 
([[ 
)[[ 	
;[[	 
„
[C:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Dto\UserProfileDto.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Dto "
{ 
public 

class 
UserProfileDto 
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public		 
string		 
UserName		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
string

 
Email

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
string 
FullName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
? 
Bio 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
? 
	Interests  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
? 
ImageUrl 
{  !
get" %
;% &
set' *
;* +
}, -
public 

string 
Role 
{ 
get 
; 
set !
;! "
}# $
} 
} Ÿ
`C:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Dto\UserImageProfileDto.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Dto "
{ 
public 
class	 
UserImageProfileDto "
{ 
public 

Guid 
Id 
{ 
get 
; 
set 
; 
}  
public 
string 
FileName 
{ 
get "
;" #
set$ '
;' (
}) *
public 

string 
FileExtension 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Url 
{ 
get 
; 
set !
;! "
}# $
}		 
}

 Í
eC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Dto\UpdateUserRoleRequestDto.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Dto "
{ 
public 

class $
UpdateUserRoleRequestDto )
{ 
public 
string 
NewRole 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
string. 4
.4 5
Empty5 :
;: ;
} 
} ‘	
aC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Dto\UpdateUserRequestDto.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Dto "
{ 
public 
class	  
UpdateUserRequestDto #
{ 
public 

required 
string 
Email  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
required 
string 
FullName '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
required 
string 
UserName '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
string 
? 
Bio 
{ 
get  
;  !
set" %
;% &
}' (
public		 
Guid		 
?		 
ImageId		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
}

 
} â
iC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Dto\UpdateUserProfileResponseDto.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Dto "
{ 
public 
class	 (
UpdateUserProfileResponseDto +
{ 
public 

string 
? 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 

string 
? 
FullName 
{ 
get !
;! "
set# &
;& '
}( )
public 

string 
? 
UserName 
{ 
get !
;! "
set# &
;& '
}( )
public		 

string		 
?		 
	Interests		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public

 

string

 
?

 
Bio

 
{

 
get

 
;

 
set

 !
;

! "
}

# $
public 

UserImageProfileDto 
? 
Image  %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} ÿ	
hC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Dto\UpdateUserProfileRequestDto.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Dto "
{ 
public 
class	 '
UpdateUserProfileRequestDto *
{ 
public 

string 
? 
FullName 
{ 
get !
;! "
set# &
;& '
}( )
public		 

string		 
?		 
UserName		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public

 

string

 
?

 
Bio

 
{

 
get

 
;

 
set

 !
;

! "
}

# $
public 

string 
? 
	Interests 
{ 
get "
;" #
set$ '
;' (
}) *
public 

	IFormFile 
? 
	ImageFile 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} €
eC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Dto\UpdateUserCredentialsDto.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Dto "
{ 
public 
class	 $
UpdateUserCredentialsDto '
{ 
public 

string 
? 
CurrentPassword "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 

string 
? 
NewPassword 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ∞
eC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Dto\UpdateCategoryRequestDto.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Dto "
{ 
public 
class	 $
UpdateCategoryRequestDto '
{ 
public 

string 
Name 
{ 
get 
; 
set !
;! "
}# $
public 

string 
	UrlHandle 
{ 
get !
;! "
set# &
;& '
}( )
} 
} ±
eC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Dto\UpdateBlogPostRequestDto.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Dto "
{ 
public 
class	 $
UpdateBlogPostRequestDto '
{ 
public 

string 
Title 
{ 
get 
; 
set "
;" #
}$ %
public 

string 
ShortDescription "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 

string 
Content 
{ 
get 
;  
set! $
;$ %
}& '
public 

string 
FeaturedImageUrl "
{# $
get% (
;( )
set* -
;- .
}/ 0
public		 

string		 
	UrlHandle		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
public

 

DateTime

 
PublishedDate

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 

bool 
	IsVisible 
{ 
get 
;  
set! $
;$ %
}& '
public 

List 
< 
Guid 
> 

Categories  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
new1 4
List5 9
<9 :
Guid: >
>> ?
(@ A
)B C
;C D
} 
} à
`C:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Dto\RegisterResponseDto.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Dto "
{ 
public 

class 
RegisterResponseDto $
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
FullName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
? 
Bio 
{ 
get  
;  !
set" %
;% &
}' (
public$$ 
string$$ 
?$$ 
	Interests$$  
{$$! "
get$$# &
;$$& '
set$$( +
;$$+ ,
}$$- .
public)) 
string)) 
?)) 
ImageUrl)) 
{))  !
get))" %
;))% &
set))' *
;))* +
})), -
public.. 
string.. 
Role.. 
{.. 
get..  
;..  !
set.." %
;..% &
}..' (
public33 
string33 
Message33 
{33 
get33  #
;33# $
set33% (
;33( )
}33* +
}44 
}55 ∏
_C:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Dto\RegisterRequestDto.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Dto "
{ 
public 

class 
RegisterRequestDto #
{		 
[ 	
Required	 
] 
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
[ 	
EmailAddress	 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
] 
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
[   	
Required  	 
]   
public!! 
string!! 
FullName!! 
{!!  
get!!! $
;!!$ %
set!!& )
;!!) *
}!!+ ,
public&& 
string&& 
?&& 
Bio&& 
{&& 
get&&  
;&&  !
set&&" %
;&&% &
}&&' (
public++ 
string++ 
?++ 
InitialRole++ "
{++# $
get++% (
;++( )
set++* -
;++- .
}++/ 0
},, 
}-- û	
]C:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Dto\LoginResponseDto.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Dto "
{ 
public 
class	 
LoginResponseDto 
{ 
public 

string 
Email 
{ 
get 
; 
set "
;" #
}$ %
public 

string 
Token 
{ 
get 
; 
set "
;" #
}$ %
public 

List 
< 
string 
> 
Roles 
{ 
get  #
;# $
set% (
;( )
}* +
public 

string 
UserName 
{ 
get  
;  !
set" %
;% &
}' (
public		 

string		 
FullName		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
}

 
} …
\C:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Dto\LoginRequestDto.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Dto "
{ 
public 
class	 
LoginRequestDto 
{ 
[ 
Required 
( 
ErrorMessage 
= 
$str 0
)0 1
]1 2
[ 
EmailAddress 
( 
ErrorMessage 
=  
$str! 7
)7 8
]8 9
public		 

string		 
Email		 
{		 
get		 
;		 
set		 "
;		" #
}		$ %
[ 
Required 
( 
ErrorMessage 
= 
$str 3
)3 4
]4 5
public 

string 
Password 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ë
\C:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Dto\FavoritePostDto.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Dto "
{ 
public 
class	 
FavoritePostDto 
{ 
public 

Guid 
Id 
{ 
get 
; 
set 
; 
}  
public 

string 
UserId 
{ 
get 
; 
set  #
;# $
}% &
public		 

Guid		 

BlogPostId		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public 

string 
BlogPostTitle 
{  !
get" %
;% &
set' *
;* +
}, -
public 

string 
BlogPostUrlHandle #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 

string 
BlogPostImageUrl "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 

string 
? 
AuthorImageUrl !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 

string 
AuthorUserName  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 

DateTime 
FavoritedAt 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} ‘
aC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Dto\CreateUserRequestDto.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Dto "
{ 
public 
class	  
CreateUserRequestDto #
{ 
public		 
string		 
FullName		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
=		* +
string		, 2
.		2 3
Empty		3 8
;		8 9
public 

string 
UserName 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
public 

string 
Email 
{ 
get 
; 
set "
;" #
}$ %
=& '
string( .
.. /
Empty/ 4
;4 5
public 

string 
Password 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
public 

string 
Bio 
{ 
get 
; 
set  
;  !
}" #
=$ %
string& ,
., -
Empty- 2
;2 3
public 

string 
	Interests 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 

string 
Role 
{ 
get 
; 
set !
;! "
}# $
=% &
$str' /
;/ 0
} 
} ¶
`C:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Dto\CreateCategoriesDto.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Dto "
{ 
public 

class 
CreateCategoriesDto $
{		 
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 
	UrlHandle 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} ≠
eC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Dto\CreateBlogPostRequestDto.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Dto "
{ 
public 
class	 $
CreateBlogPostRequestDto '
{ 
public 

string 
Title 
{ 
get 
; 
set "
;" #
}$ %
public 

string 
ShortDescription "
{# $
get% (
;( )
set* -
;- .
}/ 0
public		 

string		 
Content		 
{		 
get		 
;		  
set		! $
;		$ %
}		& '
public

 

string

 
FeaturedImageUrl

 "
{

# $
get

% (
;

( )
set

* -
;

- .
}

/ 0
public 

string 
	UrlHandle 
{ 
get !
;! "
set# &
;& '
}( )
public 

DateTime 
PublishedDate !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 

bool 
	IsVisible 
{ 
get 
;  
set! $
;$ %
}& '
public 

List 
< 
Guid 
> 

Categories  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
new1 4
List5 9
<9 :
Guid: >
>> ?
(? @
)@ A
;A B
} 
} ™
XC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Dto\CategoryDto.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Dto "
{ 
public 

class 
CategoryDto 
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
	UrlHandle 
{  !
get" %
;% &
set' *
;* +
}, -
} 
}		 ≈
XC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Dto\BlogPostDto.cs
public 
class 
BlogPostDto 
{ 
public 

Guid 
Id 
{ 
get 
; 
set 
; 
}  
public 

string 
Title 
{ 
get 
; 
set "
;" #
}$ %
public 

string 
ShortDescription "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 

string 
Content 
{ 
get 
;  
set! $
;$ %
}& '
public		 

string		 
FeaturedImageUrl		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
public

 

string

 
	UrlHandle

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 

DateTime 
PublishedDate !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 

bool 
	IsVisible 
{ 
get 
;  
set! $
;$ %
}& '
public 

List 
< 
CategoryDto 
> 

Categories '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
=6 7
new8 ;
List< @
<@ A
CategoryDtoA L
>L M
(M N
)N O
;O P
public 
int	 
	ViewCount 
{ 
get 
; 
set !
;! "
}# $
public 
BlogPostAuthorDto	 
Author !
{" #
get$ '
;' (
set) ,
;, -
}. /
} Ó
^C:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Dto\BlogPostAuthorDto.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Dto "
{ 
public 
class	 
BlogPostAuthorDto  
{ 
public 

string 
Id 
{ 
get 
; 
set 
;  
}! "
public 

string 
UserName 
{ 
get  
;  !
set" %
;% &
}' (
public 

string 
FullName 
{ 
get  
;  !
set" %
;% &
}' (
public 

string 
ImageUrl 
{ 
get  
;  !
set" %
;% &
}' (
public		 

string		 
Bio		 
{		 
get		 
;		 
set		  
;		  !
}		" #
} 
} ‡

YC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Dto\BlogImageDto.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Dto "
{ 
public 
class	 
BlogImageDto 
{ 
public 

Guid 
Id 
{ 
get 
; 
set 
; 
}  
public 

string 
FileName 
{ 
get  
;  !
set" %
;% &
}' (
public 

string 
FileExtension 
{  !
get" %
;% &
set' *
;* +
}, -
public 

string 
Title 
{ 
get 
; 
set "
;" #
}$ %
public		 

string		 
Url		 
{		 
get		 
;		 
set		  
;		  !
}		" #
public

 

DateTime

 
DateCreated

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
=

. /
DateTime

0 8
.

8 9
UtcNow

9 ?
;

? @
} 
} ´
[C:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Domain\UserProfile.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Domain %
{ 
[ 
Index 
( 	
nameof	 
( 
UserName 
) 
, 
IsUnique #
=$ %
true& *
)* +
]+ ,
public 
class	 
UserProfile 
: 
IdentityUser )
{		 
public

 

required

 
string

 
FullName

 #
{

$ %
get

& )
;

) *
set

+ .
;

. /
}

0 1
public 

string 
? 
Bio 
{ 
get 
; 
set !
;! "
}# $
public 

string 
? 
	Interests 
{ 
get "
;" #
set$ '
;' (
}) *
public 

Guid 
? 
ImageId 
{ 
get 
; 
set  #
;# $
}% &
[ 

ForeignKey 
( 
$str 
) 
] 
public 

UserImageProfile 
? 
Image "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
ICollection 
< 
BlogPost  
>  !
	BlogPosts" +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
=: ;
new< ?
List@ D
<D E
BlogPostE M
>M N
(O P
)Q R
;R S
public 

ICollection 
< 
FavoritePost #
># $
FavoriteBlogPosts% 6
{7 8
get9 <
;< =
set> A
;A B
}C D
=E F
newG J
ListK O
<O P
FavoritePostP \
>\ ]
(] ^
)^ _
;_ `
public 

UserProfile 
( 
) 
{ 
} 
public 

UserProfile 
( 
string 
fullName &
,& '
string( .
userName/ 7
,7 8
string9 ?
email@ E
)E F
:G H
baseI M
(M N
userNameN V
)V W
{ 
FullName 
= 
fullName 
; 
Email 
= 
email 
; 
UserName 
= 
userName 
; 
} 
} 
}   û
`C:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Domain\UserImageProfile.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Domain %
{ 
public 
class	 
UserImageProfile 
{ 
public 

UserImageProfile 
( 
) 
{ 
} 
public		 

Guid		 
Id		 
{		 
get		 
;		 
set		 
;		 
}		  
public

 

string

 
FileName

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 

string 
FileExtension 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Url 
{ 
get 
; 
set !
;! "
}# $
public 

UserImageProfile 
( 
Guid "
id# %
,% &
string' -
fileName. 6
,6 7
string8 >
fileExtension? L
,L M
stringN T
urlU X
)Y Z
{ 
Id 
=	 

id 
; 
FileName 
= 
fileName 
; 
FileExtension 
= 
fileExtension #
;# $
Url 	
=
 
url 
; 
} 
} 
} –
\C:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Domain\FavoritePost.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Domain %
{ 
public 
class	 
FavoritePost 
{ 
public 

Guid 
Id 
{ 
get 
; 
set 
; 
}  
public 

string 
UserId 
{ 
get 
; 
set  #
;# $
}% &
public 

Guid 

BlogPostId 
{ 
get  
;  !
set" %
;% &
}' (
public 

UserProfile 
User 
{ 
get !
;! "
set# &
;& '
}( )
public		 

BlogPost		 
BlogPost		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public

 

DateTime

 
FavoritedAt

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
=

. /
DateTime

0 8
.

8 9
UtcNow

9 ?
;

? @
public 

FavoritePost 
( 
) 
{ 
} 
} 
} ¢
XC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Domain\Category.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Domain %
{ 
public 

class 
Category 
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
	UrlHandle 
{  !
get" %
;% &
set' *
;* +
}, -
public 

List 
< 
BlogPost 
> 
	BlogPosts #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public

 

Category

 
(

 
)

 
{ 
} 
public 

Category 
( 
Guid 
id 
, 
string %
name& *
,* +
string, 2
	urlHandle3 <
)= >
{ 
Id 
=	 

id 
; 
Name 

= 
name 
; 
	UrlHandle 
= 
	urlHandle 
; 
} 
} 
} –
XC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Domain\BlogPost.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Domain %
{ 
public 
class	 
BlogPost 
{ 
public 

Guid 
Id 
{ 
get 
; 
set 
; 
}  
public 

string 
Title 
{ 
get 
; 
set "
;" #
}$ %
public		 

string		 
ShortDescription		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
public

 

string

 
Content

 
{

 
get

 
;

  
set

! $
;

$ %
}

& '
public 

string 
FeaturedImageUrl "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 

string 
	UrlHandle 
{ 
get !
;! "
set# &
;& '
}( )
public 

DateTime 
PublishedDate !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 

bool 
	IsVisible 
{ 
get 
;  
set! $
;$ %
}& '
public 

int 
	ViewCount 
{ 
get 
; 
set  #
;# $
}% &
public 

List 
< 
Category 
> 

Categories $
{% &
get' *
;* +
set, /
;/ 0
}1 2
=3 4
new5 8
List9 =
<= >
Category> F
>F G
(G H
)H I
;I J
public 

ICollection 
< 
FavoritePost #
># $
FavoriteBlogPosts% 6
{7 8
get9 <
;< =
set> A
;A B
}C D
=E F
newG J
ListK O
<O P
FavoritePostP \
>\ ]
(^ _
)` a
;a b
public 

string 
AuthorId 
{ 
get  
;  !
set" %
;% &
}' (
[ 

ForeignKey 
( 
$str 
) 
] 
public 

UserProfile 
AuthorProfile $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 

BlogPost 
( 
) 
{ 
} 
} 
} †
ZC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Models\Domain\BlogImages.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Models 
. 
Domain %
{ 
public 
class	 
	BlogImage 
{ 
public 

	BlogImage 
( 
) 
{ 
} 
public		 

Guid		 
Id		 
{		 
get		 
;		 
set		 
;		 
}		  
public

 

string

 
FileName

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 

string 
FileExtension 
{  !
get" %
;% &
set' *
;* +
}, -
public 

string 
Title 
{ 
get 
; 
set "
;" #
}$ %
public 

string 
Url 
{ 
get 
; 
set  
;  !
}" #
public 

DateTime 
DateCreated 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
DateTime0 8
.8 9
UtcNow9 ?
;? @
public 

	BlogImage 
( 
Guid 
id 
, 
string  &
fileName' /
,/ 0
string1 7
fileExtension8 E
,E F
stringG M
titleN S
,S T
stringU [
url\ _
,_ `
DateTimea i
dateCreatedj u
)v w
{ 
Id 
=	 

id 
; 
FileName 
= 
fileName 
; 
FileExtension 
= 
fileExtension #
;# $
Title 
= 
title 
; 
Url 	
=
 
url 
; 
DateCreated 
= 
dateCreated 
;  
} 
} 
} ‡è
áC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Migrations\Auth\20250407172457_UpdateUserProfileToInheritIdentityUser.cs
	namespace 	
	CodePulse
 
. 
API 
. 

Migrations "
." #
Auth# '
{		 
public 

partial 
class 2
&UpdateUserProfileToInheritIdentityUser ?
:@ A
	MigrationB K
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
	DropTable &
(& '
name 
: 
$str %
)% &
;& '
migrationBuilder 
. 

DeleteData '
(' (
table 
: 
$str (
,( )

keyColumns 
: 
new 
[  
]  !
{" #
$str$ ,
,, -
$str. 6
}7 8
,8 9
	keyValues 
: 
new 
object %
[% &
]& '
{( )
$str* P
,P Q
$strR x
}y z
)z {
;{ |
migrationBuilder 
. 

DeleteData '
(' (
table 
: 
$str (
,( )

keyColumns 
: 
new 
[  
]  !
{" #
$str$ ,
,, -
$str. 6
}7 8
,8 9
	keyValues 
: 
new 
object %
[% &
]& '
{( )
$str* P
,P Q
$strR x
}y z
)z {
;{ |
migrationBuilder 
. 

DeleteData '
(' (
table 
: 
$str (
,( )

keyColumns 
: 
new 
[  
]  !
{" #
$str$ ,
,, -
$str. 6
}7 8
,8 9
	keyValues   
:   
new   
object   %
[  % &
]  & '
{  ( )
$str  * P
,  P Q
$str  R x
}  y z
)  z {
;  { |
migrationBuilder"" 
."" 

DeleteData"" '
(""' (
table## 
:## 
$str## $
,##$ %
	keyColumn$$ 
:$$ 
$str$$ 
,$$  
keyValue%% 
:%% 
$str%% @
)%%@ A
;%%A B
migrationBuilder'' 
.'' 

DeleteData'' '
(''' (
table(( 
:(( 
$str(( $
,(($ %
	keyColumn)) 
:)) 
$str)) 
,))  
keyValue** 
:** 
$str** @
)**@ A
;**A B
migrationBuilder,, 
.,, 

DeleteData,, '
(,,' (
table-- 
:-- 
$str-- $
,--$ %
	keyColumn.. 
:.. 
$str.. 
,..  
keyValue// 
:// 
$str// @
)//@ A
;//A B
migrationBuilder11 
.11 

DeleteData11 '
(11' (
table22 
:22 
$str22 $
,22$ %
	keyColumn33 
:33 
$str33 
,33  
keyValue44 
:44 
$str44 @
)44@ A
;44A B
migrationBuilder66 
.66 
	AddColumn66 &
<66& '
string66' -
>66- .
(66. /
name77 
:77 
$str77 
,77 
table88 
:88 
$str88 $
,88$ %
type99 
:99 
$str99 %
,99% &
nullable:: 
::: 
true:: 
):: 
;::  
migrationBuilder<< 
.<< 
	AddColumn<< &
<<<& '
string<<' -
><<- .
(<<. /
name== 
:== 
$str==  
,==  !
table>> 
:>> 
$str>> $
,>>$ %
type?? 
:?? 
$str?? %
,??% &
nullable@@ 
:@@ 
false@@ 
,@@  
defaultValueAA 
:AA 
$strAA  
)AA  !
;AA! "
migrationBuilderCC 
.CC 
	AddColumnCC &
<CC& '
GuidCC' +
>CC+ ,
(CC, -
nameDD 
:DD 
$strDD 
,DD  
tableEE 
:EE 
$strEE $
,EE$ %
typeFF 
:FF 
$strFF (
,FF( )
nullableGG 
:GG 
trueGG 
)GG 
;GG  
migrationBuilderII 
.II 
	AddColumnII &
<II& '
stringII' -
>II- .
(II. /
nameJJ 
:JJ 
$strJJ !
,JJ! "
tableKK 
:KK 
$strKK $
,KK$ %
typeLL 
:LL 
$strLL %
,LL% &
nullableMM 
:MM 
trueMM 
)MM 
;MM  
migrationBuilderOO 
.OO 
CreateIndexOO (
(OO( )
namePP 
:PP 
$strPP .
,PP. /
tableQQ 
:QQ 
$strQQ $
,QQ$ %
columnRR 
:RR 
$strRR !
,RR! "
uniqueSS 
:SS 
trueSS 
,SS 
filterTT 
:TT 
$strTT /
)TT/ 0
;TT0 1
migrationBuilderVV 
.VV 
CreateIndexVV (
(VV( )
nameWW 
:WW 
$strWW /
,WW/ 0
tableXX 
:XX 
$strXX $
,XX$ %
columnYY 
:YY 
$strYY "
,YY" #
uniqueZZ 
:ZZ 
trueZZ 
,ZZ 
filter[[ 
:[[ 
$str[[ 0
)[[0 1
;[[1 2
migrationBuilder]] 
.]] 
AddForeignKey]] *
(]]* +
name^^ 
:^^ 
$str^^ @
,^^@ A
table__ 
:__ 
$str__ $
,__$ %
column`` 
:`` 
$str`` !
,``! "
principalTableaa 
:aa 
$straa  3
,aa3 4
principalColumnbb 
:bb  
$strbb! %
,bb% &
onDeletecc 
:cc 
ReferentialActioncc +
.cc+ ,
SetNullcc, 3
)cc3 4
;cc4 5
}dd 	
	protectedgg 
overridegg 
voidgg 
Downgg  $
(gg$ %
MigrationBuildergg% 5
migrationBuildergg6 F
)ggF G
{hh 	
migrationBuilderii 
.ii 
DropForeignKeyii +
(ii+ ,
namejj 
:jj 
$strjj @
,jj@ A
tablekk 
:kk 
$strkk $
)kk$ %
;kk% &
migrationBuildermm 
.mm 
	DropIndexmm &
(mm& '
namenn 
:nn 
$strnn .
,nn. /
tableoo 
:oo 
$stroo $
)oo$ %
;oo% &
migrationBuilderqq 
.qq 
	DropIndexqq &
(qq& '
namerr 
:rr 
$strrr /
,rr/ 0
tabless 
:ss 
$strss $
)ss$ %
;ss% &
migrationBuilderuu 
.uu 

DropColumnuu '
(uu' (
namevv 
:vv 
$strvv 
,vv 
tableww 
:ww 
$strww $
)ww$ %
;ww% &
migrationBuilderyy 
.yy 

DropColumnyy '
(yy' (
namezz 
:zz 
$strzz  
,zz  !
table{{ 
:{{ 
$str{{ $
){{$ %
;{{% &
migrationBuilder}} 
.}} 

DropColumn}} '
(}}' (
name~~ 
:~~ 
$str~~ 
,~~  
table 
: 
$str $
)$ %
;% &
migrationBuilder
ÅÅ 
.
ÅÅ 

DropColumn
ÅÅ '
(
ÅÅ' (
name
ÇÇ 
:
ÇÇ 
$str
ÇÇ !
,
ÇÇ! "
table
ÉÉ 
:
ÉÉ 
$str
ÉÉ $
)
ÉÉ$ %
;
ÉÉ% &
migrationBuilder
ÖÖ 
.
ÖÖ 
CreateTable
ÖÖ (
(
ÖÖ( )
name
ÜÜ 
:
ÜÜ 
$str
ÜÜ %
,
ÜÜ% &
columns
áá 
:
áá 
table
áá 
=>
áá !
new
áá" %
{
àà 
Id
ââ 
=
ââ 
table
ââ 
.
ââ 
Column
ââ %
<
ââ% &
Guid
ââ& *
>
ââ* +
(
ââ+ ,
type
ââ, 0
:
ââ0 1
$str
ââ2 D
,
ââD E
nullable
ââF N
:
ââN O
false
ââP U
)
ââU V
,
ââV W
ImageId
ää 
=
ää 
table
ää #
.
ää# $
Column
ää$ *
<
ää* +
Guid
ää+ /
>
ää/ 0
(
ää0 1
type
ää1 5
:
ää5 6
$str
ää7 I
,
ääI J
nullable
ääK S
:
ääS T
true
ääU Y
)
ääY Z
,
ääZ [
UserId
ãã 
=
ãã 
table
ãã "
.
ãã" #
Column
ãã# )
<
ãã) *
string
ãã* 0
>
ãã0 1
(
ãã1 2
type
ãã2 6
:
ãã6 7
$str
ãã8 G
,
ããG H
nullable
ããI Q
:
ããQ R
false
ããS X
)
ããX Y
,
ããY Z
Bio
åå 
=
åå 
table
åå 
.
åå  
Column
åå  &
<
åå& '
string
åå' -
>
åå- .
(
åå. /
type
åå/ 3
:
åå3 4
$str
åå5 D
,
ååD E
nullable
ååF N
:
ååN O
true
ååP T
)
ååT U
,
ååU V
FullName
çç 
=
çç 
table
çç $
.
çç$ %
Column
çç% +
<
çç+ ,
string
çç, 2
>
çç2 3
(
çç3 4
type
çç4 8
:
çç8 9
$str
çç: I
,
ççI J
nullable
ççK S
:
ççS T
false
ççU Z
)
ççZ [
,
çç[ \
UserName
éé 
=
éé 
table
éé $
.
éé$ %
Column
éé% +
<
éé+ ,
string
éé, 2
>
éé2 3
(
éé3 4
type
éé4 8
:
éé8 9
$str
éé: I
,
ééI J
nullable
ééK S
:
ééS T
false
ééU Z
)
ééZ [
}
èè 
,
èè 
constraints
êê 
:
êê 
table
êê "
=>
êê# %
{
ëë 
table
íí 
.
íí 

PrimaryKey
íí $
(
íí$ %
$str
íí% 7
,
íí7 8
x
íí9 :
=>
íí; =
x
íí> ?
.
íí? @
Id
íí@ B
)
ííB C
;
ííC D
table
ìì 
.
ìì 

ForeignKey
ìì $
(
ìì$ %
name
îî 
:
îî 
$str
îî C
,
îîC D
column
ïï 
:
ïï 
x
ïï  !
=>
ïï" $
x
ïï% &
.
ïï& '
UserId
ïï' -
,
ïï- .
principalTable
ññ &
:
ññ& '
$str
ññ( 5
,
ññ5 6
principalColumn
óó '
:
óó' (
$str
óó) -
,
óó- .
onDelete
òò  
:
òò  !
ReferentialAction
òò" 3
.
òò3 4
Cascade
òò4 ;
)
òò; <
;
òò< =
table
ôô 
.
ôô 

ForeignKey
ôô $
(
ôô$ %
name
öö 
:
öö 
$str
öö J
,
ööJ K
column
õõ 
:
õõ 
x
õõ  !
=>
õõ" $
x
õõ% &
.
õõ& '
ImageId
õõ' .
,
õõ. /
principalTable
úú &
:
úú& '
$str
úú( ;
,
úú; <
principalColumn
ùù '
:
ùù' (
$str
ùù) -
)
ùù- .
;
ùù. /
}
ûû 
)
ûû 
;
ûû 
migrationBuilder
†† 
.
†† 

InsertData
†† '
(
††' (
table
°° 
:
°° 
$str
°° $
,
°°$ %
columns
¢¢ 
:
¢¢ 
new
¢¢ 
[
¢¢ 
]
¢¢ 
{
¢¢  
$str
¢¢! %
,
¢¢% &
$str
¢¢' 9
,
¢¢9 :
$str
¢¢; A
,
¢¢A B
$str
¢¢C S
}
¢¢T U
,
¢¢U V
values
££ 
:
££ 
new
££ 
object
££ "
[
££" #
,
££# $
]
££$ %
{
§§ 
{
•• 
$str
•• <
,
••< =
$str
••> d
,
••d e
$str
••f n
,
••n o
$str
••p x
}
••y z
,
••z {
{
¶¶ 
$str
¶¶ <
,
¶¶< =
$str
¶¶> d
,
¶¶d e
$str
¶¶f m
,
¶¶m n
$str
¶¶o v
}
¶¶w x
,
¶¶x y
{
ßß 
$str
ßß <
,
ßß< =
$str
ßß> d
,
ßßd e
$str
ßßf n
,
ßßn o
$str
ßßp x
}
ßßy z
}
®® 
)
®® 
;
®® 
migrationBuilder
™™ 
.
™™ 

InsertData
™™ '
(
™™' (
table
´´ 
:
´´ 
$str
´´ $
,
´´$ %
columns
¨¨ 
:
¨¨ 
new
¨¨ 
[
¨¨ 
]
¨¨ 
{
¨¨  
$str
¨¨! %
,
¨¨% &
$str
¨¨' :
,
¨¨: ;
$str
¨¨< N
,
¨¨N O
$str
¨¨P W
,
¨¨W X
$str
¨¨Y i
,
¨¨i j
$str
¨¨k {
,
¨¨{ |
$str¨¨} â
,¨¨â ä
$str¨¨ã ú
,¨¨ú ù
$str¨¨û ≤
,¨¨≤ ≥
$str¨¨¥ ¬
,¨¨¬ √
$str¨¨ƒ —
,¨¨— “
$str¨¨” È
,¨¨È Í
$str¨¨Î ˙
,¨¨˙ ˚
$str¨¨¸ é
,¨¨é è
$str¨¨ê ö
}¨¨õ ú
,¨¨ú ù
values
≠≠ 
:
≠≠ 
new
≠≠ 
object
≠≠ "
[
≠≠" #
]
≠≠# $
{
≠≠% &
$str
≠≠' M
,
≠≠M N
$num
≠≠O P
,
≠≠P Q
$str
≠≠R x
,
≠≠x y
$str≠≠z è
,≠≠è ê
true≠≠ë ï
,≠≠ï ñ
false≠≠ó ú
,≠≠ú ù
null≠≠û ¢
,≠≠¢ £
$str≠≠§ π
,≠≠π ∫
$str≠≠ª –
,≠≠– —
$str≠≠“ ®
,≠≠® ©
null≠≠™ Æ
,≠≠Æ Ø
false≠≠∞ µ
,≠≠µ ∂
$str≠≠∑ ›
,≠≠› ﬁ
false≠≠ﬂ ‰
,≠≠‰ Â
$str≠≠Ê Ì
}≠≠Ó Ô
)≠≠Ô 
;≠≠ Ò
migrationBuilder
ØØ 
.
ØØ 

InsertData
ØØ '
(
ØØ' (
table
∞∞ 
:
∞∞ 
$str
∞∞ (
,
∞∞( )
columns
±± 
:
±± 
new
±± 
[
±± 
]
±± 
{
±±  
$str
±±! )
,
±±) *
$str
±±+ 3
}
±±4 5
,
±±5 6
values
≤≤ 
:
≤≤ 
new
≤≤ 
object
≤≤ "
[
≤≤" #
,
≤≤# $
]
≤≤$ %
{
≥≥ 
{
¥¥ 
$str
¥¥ <
,
¥¥< =
$str
¥¥> d
}
¥¥e f
,
¥¥f g
{
µµ 
$str
µµ <
,
µµ< =
$str
µµ> d
}
µµe f
,
µµf g
{
∂∂ 
$str
∂∂ <
,
∂∂< =
$str
∂∂> d
}
∂∂e f
}
∑∑ 
)
∑∑ 
;
∑∑ 
migrationBuilder
ππ 
.
ππ 

InsertData
ππ '
(
ππ' (
table
∫∫ 
:
∫∫ 
$str
∫∫ &
,
∫∫& '
columns
ªª 
:
ªª 
new
ªª 
[
ªª 
]
ªª 
{
ªª  
$str
ªª! %
,
ªª% &
$str
ªª' ,
,
ªª, -
$str
ªª. 8
,
ªª8 9
$str
ªª: C
,
ªªC D
$str
ªªE M
,
ªªM N
$str
ªªO Y
}
ªªZ [
,
ªª[ \
values
ºº 
:
ºº 
new
ºº 
object
ºº "
[
ºº" #
]
ºº# $
{
ºº% &
new
ºº' *
Guid
ºº+ /
(
ºº/ 0
$str
ºº0 V
)
ººV W
,
ººW X
$str
ººY s
,
ººs t
$strººu Ñ
,ººÑ Ö
nullººÜ ä
,ººä ã
$strººå ≤
,ºº≤ ≥
$strºº¥ ª
}ººº Ω
)ººΩ æ
;ººæ ø
migrationBuilder
ææ 
.
ææ 
CreateIndex
ææ (
(
ææ( )
name
øø 
:
øø 
$str
øø 0
,
øø0 1
table
¿¿ 
:
¿¿ 
$str
¿¿ &
,
¿¿& '
column
¡¡ 
:
¡¡ 
$str
¡¡ !
)
¡¡! "
;
¡¡" #
migrationBuilder
√√ 
.
√√ 
CreateIndex
√√ (
(
√√( )
name
ƒƒ 
:
ƒƒ 
$str
ƒƒ /
,
ƒƒ/ 0
table
≈≈ 
:
≈≈ 
$str
≈≈ &
,
≈≈& '
column
∆∆ 
:
∆∆ 
$str
∆∆  
)
∆∆  !
;
∆∆! "
migrationBuilder
»» 
.
»» 
CreateIndex
»» (
(
»»( )
name
…… 
:
…… 
$str
…… 1
,
……1 2
table
   
:
   
$str
   &
,
  & '
column
ÀÀ 
:
ÀÀ 
$str
ÀÀ "
,
ÀÀ" #
unique
ÃÃ 
:
ÃÃ 
true
ÃÃ 
)
ÃÃ 
;
ÃÃ 
}
ÕÕ 	
}
ŒŒ 
}œœ ™§
nC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Migrations\Auth\20250406230442_InitialCreate.cs
	namespace 	
	CodePulse
 
. 
API 
. 

Migrations "
." #
Auth# '
{		 
public 

partial 
class 
InitialCreate &
:' (
	Migration) 2
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str #
,# $
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
string& ,
>, -
(- .
type. 2
:2 3
$str4 C
,C D
nullableE M
:M N
falseO T
)T U
,U V
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 E
,E F
	maxLengthG P
:P Q
$numR U
,U V
nullableW _
:_ `
truea e
)e f
,f g
NormalizedName "
=# $
table% *
.* +
Column+ 1
<1 2
string2 8
>8 9
(9 :
type: >
:> ?
$str@ O
,O P
	maxLengthQ Z
:Z [
$num\ _
,_ `
nullablea i
:i j
truek o
)o p
,p q
ConcurrencyStamp $
=% &
table' ,
., -
Column- 3
<3 4
string4 :
>: ;
(; <
type< @
:@ A
$strB Q
,Q R
nullableS [
:[ \
true] a
)a b
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 5
,5 6
x7 8
=>9 ;
x< =
.= >
Id> @
)@ A
;A B
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str #
,# $
columns   
:   
table   
=>   !
new  " %
{!! 
Id"" 
="" 
table"" 
."" 
Column"" %
<""% &
string""& ,
>"", -
(""- .
type"". 2
:""2 3
$str""4 C
,""C D
nullable""E M
:""M N
false""O T
)""T U
,""U V
UserName## 
=## 
table## $
.##$ %
Column##% +
<##+ ,
string##, 2
>##2 3
(##3 4
type##4 8
:##8 9
$str##: I
,##I J
	maxLength##K T
:##T U
$num##V Y
,##Y Z
nullable##[ c
:##c d
true##e i
)##i j
,##j k
NormalizedUserName$$ &
=$$' (
table$$) .
.$$. /
Column$$/ 5
<$$5 6
string$$6 <
>$$< =
($$= >
type$$> B
:$$B C
$str$$D S
,$$S T
	maxLength$$U ^
:$$^ _
$num$$` c
,$$c d
nullable$$e m
:$$m n
true$$o s
)$$s t
,$$t u
Email%% 
=%% 
table%% !
.%%! "
Column%%" (
<%%( )
string%%) /
>%%/ 0
(%%0 1
type%%1 5
:%%5 6
$str%%7 F
,%%F G
	maxLength%%H Q
:%%Q R
$num%%S V
,%%V W
nullable%%X `
:%%` a
true%%b f
)%%f g
,%%g h
NormalizedEmail&& #
=&&$ %
table&&& +
.&&+ ,
Column&&, 2
<&&2 3
string&&3 9
>&&9 :
(&&: ;
type&&; ?
:&&? @
$str&&A P
,&&P Q
	maxLength&&R [
:&&[ \
$num&&] `
,&&` a
nullable&&b j
:&&j k
true&&l p
)&&p q
,&&q r
EmailConfirmed'' "
=''# $
table''% *
.''* +
Column''+ 1
<''1 2
bool''2 6
>''6 7
(''7 8
type''8 <
:''< =
$str''> C
,''C D
nullable''E M
:''M N
false''O T
)''T U
,''U V
PasswordHash((  
=((! "
table((# (
.((( )
Column(() /
<((/ 0
string((0 6
>((6 7
(((7 8
type((8 <
:((< =
$str((> M
,((M N
nullable((O W
:((W X
true((Y ]
)((] ^
,((^ _
SecurityStamp)) !
=))" #
table))$ )
.))) *
Column))* 0
<))0 1
string))1 7
>))7 8
())8 9
type))9 =
:))= >
$str))? N
,))N O
nullable))P X
:))X Y
true))Z ^
)))^ _
,))_ `
ConcurrencyStamp** $
=**% &
table**' ,
.**, -
Column**- 3
<**3 4
string**4 :
>**: ;
(**; <
type**< @
:**@ A
$str**B Q
,**Q R
nullable**S [
:**[ \
true**] a
)**a b
,**b c
PhoneNumber++ 
=++  !
table++" '
.++' (
Column++( .
<++. /
string++/ 5
>++5 6
(++6 7
type++7 ;
:++; <
$str++= L
,++L M
nullable++N V
:++V W
true++X \
)++\ ]
,++] ^ 
PhoneNumberConfirmed,, (
=,,) *
table,,+ 0
.,,0 1
Column,,1 7
<,,7 8
bool,,8 <
>,,< =
(,,= >
type,,> B
:,,B C
$str,,D I
,,,I J
nullable,,K S
:,,S T
false,,U Z
),,Z [
,,,[ \
TwoFactorEnabled-- $
=--% &
table--' ,
.--, -
Column--- 3
<--3 4
bool--4 8
>--8 9
(--9 :
type--: >
:--> ?
$str--@ E
,--E F
nullable--G O
:--O P
false--Q V
)--V W
,--W X

LockoutEnd.. 
=..  
table..! &
...& '
Column..' -
<..- .
DateTimeOffset... <
>..< =
(..= >
type..> B
:..B C
$str..D T
,..T U
nullable..V ^
:..^ _
true..` d
)..d e
,..e f
LockoutEnabled// "
=//# $
table//% *
.//* +
Column//+ 1
<//1 2
bool//2 6
>//6 7
(//7 8
type//8 <
://< =
$str//> C
,//C D
nullable//E M
://M N
false//O T
)//T U
,//U V
AccessFailedCount00 %
=00& '
table00( -
.00- .
Column00. 4
<004 5
int005 8
>008 9
(009 :
type00: >
:00> ?
$str00@ E
,00E F
nullable00G O
:00O P
false00Q V
)00V W
}11 
,11 
constraints22 
:22 
table22 "
=>22# %
{33 
table44 
.44 

PrimaryKey44 $
(44$ %
$str44% 5
,445 6
x447 8
=>449 ;
x44< =
.44= >
Id44> @
)44@ A
;44A B
}55 
)55 
;55 
migrationBuilder77 
.77 
CreateTable77 (
(77( )
name88 
:88 
$str88 )
,88) *
columns99 
:99 
table99 
=>99 !
new99" %
{:: 
Id;; 
=;; 
table;; 
.;; 
Column;; %
<;;% &
Guid;;& *
>;;* +
(;;+ ,
type;;, 0
:;;0 1
$str;;2 D
,;;D E
nullable;;F N
:;;N O
false;;P U
);;U V
,;;V W
FileName<< 
=<< 
table<< $
.<<$ %
Column<<% +
<<<+ ,
string<<, 2
><<2 3
(<<3 4
type<<4 8
:<<8 9
$str<<: I
,<<I J
nullable<<K S
:<<S T
false<<U Z
)<<Z [
,<<[ \
FileExtension== !
===" #
table==$ )
.==) *
Column==* 0
<==0 1
string==1 7
>==7 8
(==8 9
type==9 =
:=== >
$str==? N
,==N O
nullable==P X
:==X Y
false==Z _
)==_ `
,==` a
Url>> 
=>> 
table>> 
.>>  
Column>>  &
<>>& '
string>>' -
>>>- .
(>>. /
type>>/ 3
:>>3 4
$str>>5 D
,>>D E
nullable>>F N
:>>N O
false>>P U
)>>U V
}?? 
,?? 
constraints@@ 
:@@ 
table@@ "
=>@@# %
{AA 
tableBB 
.BB 

PrimaryKeyBB $
(BB$ %
$strBB% ;
,BB; <
xBB= >
=>BB? A
xBBB C
.BBC D
IdBBD F
)BBF G
;BBG H
}CC 
)CC 
;CC 
migrationBuilderEE 
.EE 
CreateTableEE (
(EE( )
nameFF 
:FF 
$strFF (
,FF( )
columnsGG 
:GG 
tableGG 
=>GG !
newGG" %
{HH 
IdII 
=II 
tableII 
.II 
ColumnII %
<II% &
intII& )
>II) *
(II* +
typeII+ /
:II/ 0
$strII1 6
,II6 7
nullableII8 @
:II@ A
falseIIB G
)IIG H
.JJ 

AnnotationJJ #
(JJ# $
$strJJ$ 8
,JJ8 9
$strJJ: @
)JJ@ A
,JJA B
RoleIdKK 
=KK 
tableKK "
.KK" #
ColumnKK# )
<KK) *
stringKK* 0
>KK0 1
(KK1 2
typeKK2 6
:KK6 7
$strKK8 G
,KKG H
nullableKKI Q
:KKQ R
falseKKS X
)KKX Y
,KKY Z
	ClaimTypeLL 
=LL 
tableLL  %
.LL% &
ColumnLL& ,
<LL, -
stringLL- 3
>LL3 4
(LL4 5
typeLL5 9
:LL9 :
$strLL; J
,LLJ K
nullableLLL T
:LLT U
trueLLV Z
)LLZ [
,LL[ \

ClaimValueMM 
=MM  
tableMM! &
.MM& '
ColumnMM' -
<MM- .
stringMM. 4
>MM4 5
(MM5 6
typeMM6 :
:MM: ;
$strMM< K
,MMK L
nullableMMM U
:MMU V
trueMMW [
)MM[ \
}NN 
,NN 
constraintsOO 
:OO 
tableOO "
=>OO# %
{PP 
tableQQ 
.QQ 

PrimaryKeyQQ $
(QQ$ %
$strQQ% :
,QQ: ;
xQQ< =
=>QQ> @
xQQA B
.QQB C
IdQQC E
)QQE F
;QQF G
tableRR 
.RR 

ForeignKeyRR $
(RR$ %
nameSS 
:SS 
$strSS F
,SSF G
columnTT 
:TT 
xTT  !
=>TT" $
xTT% &
.TT& '
RoleIdTT' -
,TT- .
principalTableUU &
:UU& '
$strUU( 5
,UU5 6
principalColumnVV '
:VV' (
$strVV) -
,VV- .
onDeleteWW  
:WW  !
ReferentialActionWW" 3
.WW3 4
CascadeWW4 ;
)WW; <
;WW< =
}XX 
)XX 
;XX 
migrationBuilderZZ 
.ZZ 
CreateTableZZ (
(ZZ( )
name[[ 
:[[ 
$str[[ (
,[[( )
columns\\ 
:\\ 
table\\ 
=>\\ !
new\\" %
{]] 
Id^^ 
=^^ 
table^^ 
.^^ 
Column^^ %
<^^% &
int^^& )
>^^) *
(^^* +
type^^+ /
:^^/ 0
$str^^1 6
,^^6 7
nullable^^8 @
:^^@ A
false^^B G
)^^G H
.__ 

Annotation__ #
(__# $
$str__$ 8
,__8 9
$str__: @
)__@ A
,__A B
UserId`` 
=`` 
table`` "
.``" #
Column``# )
<``) *
string``* 0
>``0 1
(``1 2
type``2 6
:``6 7
$str``8 G
,``G H
nullable``I Q
:``Q R
false``S X
)``X Y
,``Y Z
	ClaimTypeaa 
=aa 
tableaa  %
.aa% &
Columnaa& ,
<aa, -
stringaa- 3
>aa3 4
(aa4 5
typeaa5 9
:aa9 :
$straa; J
,aaJ K
nullableaaL T
:aaT U
trueaaV Z
)aaZ [
,aa[ \

ClaimValuebb 
=bb  
tablebb! &
.bb& '
Columnbb' -
<bb- .
stringbb. 4
>bb4 5
(bb5 6
typebb6 :
:bb: ;
$strbb< K
,bbK L
nullablebbM U
:bbU V
truebbW [
)bb[ \
}cc 
,cc 
constraintsdd 
:dd 
tabledd "
=>dd# %
{ee 
tableff 
.ff 

PrimaryKeyff $
(ff$ %
$strff% :
,ff: ;
xff< =
=>ff> @
xffA B
.ffB C
IdffC E
)ffE F
;ffF G
tablegg 
.gg 

ForeignKeygg $
(gg$ %
namehh 
:hh 
$strhh F
,hhF G
columnii 
:ii 
xii  !
=>ii" $
xii% &
.ii& '
UserIdii' -
,ii- .
principalTablejj &
:jj& '
$strjj( 5
,jj5 6
principalColumnkk '
:kk' (
$strkk) -
,kk- .
onDeletell  
:ll  !
ReferentialActionll" 3
.ll3 4
Cascadell4 ;
)ll; <
;ll< =
}mm 
)mm 
;mm 
migrationBuilderoo 
.oo 
CreateTableoo (
(oo( )
namepp 
:pp 
$strpp (
,pp( )
columnsqq 
:qq 
tableqq 
=>qq !
newqq" %
{rr 
LoginProviderss !
=ss" #
tabless$ )
.ss) *
Columnss* 0
<ss0 1
stringss1 7
>ss7 8
(ss8 9
typess9 =
:ss= >
$strss? N
,ssN O
nullablessP X
:ssX Y
falsessZ _
)ss_ `
,ss` a
ProviderKeytt 
=tt  !
tablett" '
.tt' (
Columntt( .
<tt. /
stringtt/ 5
>tt5 6
(tt6 7
typett7 ;
:tt; <
$strtt= L
,ttL M
nullablettN V
:ttV W
falsettX ]
)tt] ^
,tt^ _
ProviderDisplayNameuu '
=uu( )
tableuu* /
.uu/ 0
Columnuu0 6
<uu6 7
stringuu7 =
>uu= >
(uu> ?
typeuu? C
:uuC D
$struuE T
,uuT U
nullableuuV ^
:uu^ _
trueuu` d
)uud e
,uue f
UserIdvv 
=vv 
tablevv "
.vv" #
Columnvv# )
<vv) *
stringvv* 0
>vv0 1
(vv1 2
typevv2 6
:vv6 7
$strvv8 G
,vvG H
nullablevvI Q
:vvQ R
falsevvS X
)vvX Y
}ww 
,ww 
constraintsxx 
:xx 
tablexx "
=>xx# %
{yy 
tablezz 
.zz 

PrimaryKeyzz $
(zz$ %
$strzz% :
,zz: ;
xzz< =
=>zz> @
newzzA D
{zzE F
xzzG H
.zzH I
LoginProviderzzI V
,zzV W
xzzX Y
.zzY Z
ProviderKeyzzZ e
}zzf g
)zzg h
;zzh i
table{{ 
.{{ 

ForeignKey{{ $
({{$ %
name|| 
:|| 
$str|| F
,||F G
column}} 
:}} 
x}}  !
=>}}" $
x}}% &
.}}& '
UserId}}' -
,}}- .
principalTable~~ &
:~~& '
$str~~( 5
,~~5 6
principalColumn '
:' (
$str) -
,- .
onDelete
ÄÄ  
:
ÄÄ  !
ReferentialAction
ÄÄ" 3
.
ÄÄ3 4
Cascade
ÄÄ4 ;
)
ÄÄ; <
;
ÄÄ< =
}
ÅÅ 
)
ÅÅ 
;
ÅÅ 
migrationBuilder
ÉÉ 
.
ÉÉ 
CreateTable
ÉÉ (
(
ÉÉ( )
name
ÑÑ 
:
ÑÑ 
$str
ÑÑ '
,
ÑÑ' (
columns
ÖÖ 
:
ÖÖ 
table
ÖÖ 
=>
ÖÖ !
new
ÖÖ" %
{
ÜÜ 
UserId
áá 
=
áá 
table
áá "
.
áá" #
Column
áá# )
<
áá) *
string
áá* 0
>
áá0 1
(
áá1 2
type
áá2 6
:
áá6 7
$str
áá8 G
,
ááG H
nullable
ááI Q
:
ááQ R
false
ááS X
)
ááX Y
,
ááY Z
RoleId
àà 
=
àà 
table
àà "
.
àà" #
Column
àà# )
<
àà) *
string
àà* 0
>
àà0 1
(
àà1 2
type
àà2 6
:
àà6 7
$str
àà8 G
,
ààG H
nullable
ààI Q
:
ààQ R
false
ààS X
)
ààX Y
}
ââ 
,
ââ 
constraints
ää 
:
ää 
table
ää "
=>
ää# %
{
ãã 
table
åå 
.
åå 

PrimaryKey
åå $
(
åå$ %
$str
åå% 9
,
åå9 :
x
åå; <
=>
åå= ?
new
åå@ C
{
ååD E
x
ååF G
.
ååG H
UserId
ååH N
,
ååN O
x
ååP Q
.
ååQ R
RoleId
ååR X
}
ååY Z
)
ååZ [
;
åå[ \
table
çç 
.
çç 

ForeignKey
çç $
(
çç$ %
name
éé 
:
éé 
$str
éé E
,
ééE F
column
èè 
:
èè 
x
èè  !
=>
èè" $
x
èè% &
.
èè& '
RoleId
èè' -
,
èè- .
principalTable
êê &
:
êê& '
$str
êê( 5
,
êê5 6
principalColumn
ëë '
:
ëë' (
$str
ëë) -
,
ëë- .
onDelete
íí  
:
íí  !
ReferentialAction
íí" 3
.
íí3 4
Cascade
íí4 ;
)
íí; <
;
íí< =
table
ìì 
.
ìì 

ForeignKey
ìì $
(
ìì$ %
name
îî 
:
îî 
$str
îî E
,
îîE F
column
ïï 
:
ïï 
x
ïï  !
=>
ïï" $
x
ïï% &
.
ïï& '
UserId
ïï' -
,
ïï- .
principalTable
ññ &
:
ññ& '
$str
ññ( 5
,
ññ5 6
principalColumn
óó '
:
óó' (
$str
óó) -
,
óó- .
onDelete
òò  
:
òò  !
ReferentialAction
òò" 3
.
òò3 4
Cascade
òò4 ;
)
òò; <
;
òò< =
}
ôô 
)
ôô 
;
ôô 
migrationBuilder
õõ 
.
õõ 
CreateTable
õõ (
(
õõ( )
name
úú 
:
úú 
$str
úú (
,
úú( )
columns
ùù 
:
ùù 
table
ùù 
=>
ùù !
new
ùù" %
{
ûû 
UserId
üü 
=
üü 
table
üü "
.
üü" #
Column
üü# )
<
üü) *
string
üü* 0
>
üü0 1
(
üü1 2
type
üü2 6
:
üü6 7
$str
üü8 G
,
üüG H
nullable
üüI Q
:
üüQ R
false
üüS X
)
üüX Y
,
üüY Z
LoginProvider
†† !
=
††" #
table
††$ )
.
††) *
Column
††* 0
<
††0 1
string
††1 7
>
††7 8
(
††8 9
type
††9 =
:
††= >
$str
††? N
,
††N O
nullable
††P X
:
††X Y
false
††Z _
)
††_ `
,
††` a
Name
°° 
=
°° 
table
°°  
.
°°  !
Column
°°! '
<
°°' (
string
°°( .
>
°°. /
(
°°/ 0
type
°°0 4
:
°°4 5
$str
°°6 E
,
°°E F
nullable
°°G O
:
°°O P
false
°°Q V
)
°°V W
,
°°W X
Value
¢¢ 
=
¢¢ 
table
¢¢ !
.
¢¢! "
Column
¢¢" (
<
¢¢( )
string
¢¢) /
>
¢¢/ 0
(
¢¢0 1
type
¢¢1 5
:
¢¢5 6
$str
¢¢7 F
,
¢¢F G
nullable
¢¢H P
:
¢¢P Q
true
¢¢R V
)
¢¢V W
}
££ 
,
££ 
constraints
§§ 
:
§§ 
table
§§ "
=>
§§# %
{
•• 
table
¶¶ 
.
¶¶ 

PrimaryKey
¶¶ $
(
¶¶$ %
$str
¶¶% :
,
¶¶: ;
x
¶¶< =
=>
¶¶> @
new
¶¶A D
{
¶¶E F
x
¶¶G H
.
¶¶H I
UserId
¶¶I O
,
¶¶O P
x
¶¶Q R
.
¶¶R S
LoginProvider
¶¶S `
,
¶¶` a
x
¶¶b c
.
¶¶c d
Name
¶¶d h
}
¶¶i j
)
¶¶j k
;
¶¶k l
table
ßß 
.
ßß 

ForeignKey
ßß $
(
ßß$ %
name
®® 
:
®® 
$str
®® F
,
®®F G
column
©© 
:
©© 
x
©©  !
=>
©©" $
x
©©% &
.
©©& '
UserId
©©' -
,
©©- .
principalTable
™™ &
:
™™& '
$str
™™( 5
,
™™5 6
principalColumn
´´ '
:
´´' (
$str
´´) -
,
´´- .
onDelete
¨¨  
:
¨¨  !
ReferentialAction
¨¨" 3
.
¨¨3 4
Cascade
¨¨4 ;
)
¨¨; <
;
¨¨< =
}
≠≠ 
)
≠≠ 
;
≠≠ 
migrationBuilder
ØØ 
.
ØØ 
CreateTable
ØØ (
(
ØØ( )
name
∞∞ 
:
∞∞ 
$str
∞∞ %
,
∞∞% &
columns
±± 
:
±± 
table
±± 
=>
±± !
new
±±" %
{
≤≤ 
Id
≥≥ 
=
≥≥ 
table
≥≥ 
.
≥≥ 
Column
≥≥ %
<
≥≥% &
Guid
≥≥& *
>
≥≥* +
(
≥≥+ ,
type
≥≥, 0
:
≥≥0 1
$str
≥≥2 D
,
≥≥D E
nullable
≥≥F N
:
≥≥N O
false
≥≥P U
)
≥≥U V
,
≥≥V W
UserId
¥¥ 
=
¥¥ 
table
¥¥ "
.
¥¥" #
Column
¥¥# )
<
¥¥) *
string
¥¥* 0
>
¥¥0 1
(
¥¥1 2
type
¥¥2 6
:
¥¥6 7
$str
¥¥8 G
,
¥¥G H
nullable
¥¥I Q
:
¥¥Q R
false
¥¥S X
)
¥¥X Y
,
¥¥Y Z
FullName
µµ 
=
µµ 
table
µµ $
.
µµ$ %
Column
µµ% +
<
µµ+ ,
string
µµ, 2
>
µµ2 3
(
µµ3 4
type
µµ4 8
:
µµ8 9
$str
µµ: I
,
µµI J
nullable
µµK S
:
µµS T
false
µµU Z
)
µµZ [
,
µµ[ \
UserName
∂∂ 
=
∂∂ 
table
∂∂ $
.
∂∂$ %
Column
∂∂% +
<
∂∂+ ,
string
∂∂, 2
>
∂∂2 3
(
∂∂3 4
type
∂∂4 8
:
∂∂8 9
$str
∂∂: I
,
∂∂I J
nullable
∂∂K S
:
∂∂S T
false
∂∂U Z
)
∂∂Z [
,
∂∂[ \
Bio
∑∑ 
=
∑∑ 
table
∑∑ 
.
∑∑  
Column
∑∑  &
<
∑∑& '
string
∑∑' -
>
∑∑- .
(
∑∑. /
type
∑∑/ 3
:
∑∑3 4
$str
∑∑5 D
,
∑∑D E
nullable
∑∑F N
:
∑∑N O
true
∑∑P T
)
∑∑T U
,
∑∑U V
ImageId
∏∏ 
=
∏∏ 
table
∏∏ #
.
∏∏# $
Column
∏∏$ *
<
∏∏* +
Guid
∏∏+ /
>
∏∏/ 0
(
∏∏0 1
type
∏∏1 5
:
∏∏5 6
$str
∏∏7 I
,
∏∏I J
nullable
∏∏K S
:
∏∏S T
true
∏∏U Y
)
∏∏Y Z
}
ππ 
,
ππ 
constraints
∫∫ 
:
∫∫ 
table
∫∫ "
=>
∫∫# %
{
ªª 
table
ºº 
.
ºº 

PrimaryKey
ºº $
(
ºº$ %
$str
ºº% 7
,
ºº7 8
x
ºº9 :
=>
ºº; =
x
ºº> ?
.
ºº? @
Id
ºº@ B
)
ººB C
;
ººC D
table
ΩΩ 
.
ΩΩ 

ForeignKey
ΩΩ $
(
ΩΩ$ %
name
ææ 
:
ææ 
$str
ææ C
,
ææC D
column
øø 
:
øø 
x
øø  !
=>
øø" $
x
øø% &
.
øø& '
UserId
øø' -
,
øø- .
principalTable
¿¿ &
:
¿¿& '
$str
¿¿( 5
,
¿¿5 6
principalColumn
¡¡ '
:
¡¡' (
$str
¡¡) -
,
¡¡- .
onDelete
¬¬  
:
¬¬  !
ReferentialAction
¬¬" 3
.
¬¬3 4
Cascade
¬¬4 ;
)
¬¬; <
;
¬¬< =
table
√√ 
.
√√ 

ForeignKey
√√ $
(
√√$ %
name
ƒƒ 
:
ƒƒ 
$str
ƒƒ J
,
ƒƒJ K
column
≈≈ 
:
≈≈ 
x
≈≈  !
=>
≈≈" $
x
≈≈% &
.
≈≈& '
ImageId
≈≈' .
,
≈≈. /
principalTable
∆∆ &
:
∆∆& '
$str
∆∆( ;
,
∆∆; <
principalColumn
«« '
:
««' (
$str
««) -
)
««- .
;
««. /
}
»» 
)
»» 
;
»» 
migrationBuilder
   
.
   

InsertData
   '
(
  ' (
table
ÀÀ 
:
ÀÀ 
$str
ÀÀ $
,
ÀÀ$ %
columns
ÃÃ 
:
ÃÃ 
new
ÃÃ 
[
ÃÃ 
]
ÃÃ 
{
ÃÃ  
$str
ÃÃ! %
,
ÃÃ% &
$str
ÃÃ' 9
,
ÃÃ9 :
$str
ÃÃ; A
,
ÃÃA B
$str
ÃÃC S
}
ÃÃT U
,
ÃÃU V
values
ÕÕ 
:
ÕÕ 
new
ÕÕ 
object
ÕÕ "
[
ÕÕ" #
,
ÕÕ# $
]
ÕÕ$ %
{
ŒŒ 
{
œœ 
$str
œœ <
,
œœ< =
$str
œœ> d
,
œœd e
$str
œœf n
,
œœn o
$str
œœp x
}
œœy z
,
œœz {
{
–– 
$str
–– <
,
––< =
$str
––> d
,
––d e
$str
––f m
,
––m n
$str
––o v
}
––w x
,
––x y
{
—— 
$str
—— <
,
——< =
$str
——> d
,
——d e
$str
——f n
,
——n o
$str
——p x
}
——y z
}
““ 
)
““ 
;
““ 
migrationBuilder
‘‘ 
.
‘‘ 

InsertData
‘‘ '
(
‘‘' (
table
’’ 
:
’’ 
$str
’’ $
,
’’$ %
columns
÷÷ 
:
÷÷ 
new
÷÷ 
[
÷÷ 
]
÷÷ 
{
÷÷  
$str
÷÷! %
,
÷÷% &
$str
÷÷' :
,
÷÷: ;
$str
÷÷< N
,
÷÷N O
$str
÷÷P W
,
÷÷W X
$str
÷÷Y i
,
÷÷i j
$str
÷÷k {
,
÷÷{ |
$str÷÷} â
,÷÷â ä
$str÷÷ã ú
,÷÷ú ù
$str÷÷û ≤
,÷÷≤ ≥
$str÷÷¥ ¬
,÷÷¬ √
$str÷÷ƒ —
,÷÷— “
$str÷÷” È
,÷÷È Í
$str÷÷Î ˙
,÷÷˙ ˚
$str÷÷¸ é
,÷÷é è
$str÷÷ê ö
}÷÷õ ú
,÷÷ú ù
values
◊◊ 
:
◊◊ 
new
◊◊ 
object
◊◊ "
[
◊◊" #
]
◊◊# $
{
◊◊% &
$str
◊◊' M
,
◊◊M N
$num
◊◊O P
,
◊◊P Q
$str
◊◊R x
,
◊◊x y
$str◊◊z è
,◊◊è ê
true◊◊ë ï
,◊◊ï ñ
false◊◊ó ú
,◊◊ú ù
null◊◊û ¢
,◊◊¢ £
$str◊◊§ π
,◊◊π ∫
$str◊◊ª –
,◊◊– —
$str◊◊“ ®
,◊◊® ©
null◊◊™ Æ
,◊◊Æ Ø
false◊◊∞ µ
,◊◊µ ∂
$str◊◊∑ ›
,◊◊› ﬁ
false◊◊ﬂ ‰
,◊◊‰ Â
$str◊◊Ê Ì
}◊◊Ó Ô
)◊◊Ô 
;◊◊ Ò
migrationBuilder
ŸŸ 
.
ŸŸ 

InsertData
ŸŸ '
(
ŸŸ' (
table
⁄⁄ 
:
⁄⁄ 
$str
⁄⁄ (
,
⁄⁄( )
columns
€€ 
:
€€ 
new
€€ 
[
€€ 
]
€€ 
{
€€  
$str
€€! )
,
€€) *
$str
€€+ 3
}
€€4 5
,
€€5 6
values
‹‹ 
:
‹‹ 
new
‹‹ 
object
‹‹ "
[
‹‹" #
,
‹‹# $
]
‹‹$ %
{
›› 
{
ﬁﬁ 
$str
ﬁﬁ <
,
ﬁﬁ< =
$str
ﬁﬁ> d
}
ﬁﬁe f
,
ﬁﬁf g
{
ﬂﬂ 
$str
ﬂﬂ <
,
ﬂﬂ< =
$str
ﬂﬂ> d
}
ﬂﬂe f
,
ﬂﬂf g
{
‡‡ 
$str
‡‡ <
,
‡‡< =
$str
‡‡> d
}
‡‡e f
}
·· 
)
·· 
;
·· 
migrationBuilder
„„ 
.
„„ 

InsertData
„„ '
(
„„' (
table
‰‰ 
:
‰‰ 
$str
‰‰ &
,
‰‰& '
columns
ÂÂ 
:
ÂÂ 
new
ÂÂ 
[
ÂÂ 
]
ÂÂ 
{
ÂÂ  
$str
ÂÂ! %
,
ÂÂ% &
$str
ÂÂ' ,
,
ÂÂ, -
$str
ÂÂ. 8
,
ÂÂ8 9
$str
ÂÂ: C
,
ÂÂC D
$str
ÂÂE M
,
ÂÂM N
$str
ÂÂO Y
}
ÂÂZ [
,
ÂÂ[ \
values
ÊÊ 
:
ÊÊ 
new
ÊÊ 
object
ÊÊ "
[
ÊÊ" #
]
ÊÊ# $
{
ÊÊ% &
new
ÊÊ' *
Guid
ÊÊ+ /
(
ÊÊ/ 0
$str
ÊÊ0 V
)
ÊÊV W
,
ÊÊW X
$str
ÊÊY s
,
ÊÊs t
$strÊÊu Ñ
,ÊÊÑ Ö
nullÊÊÜ ä
,ÊÊä ã
$strÊÊå ≤
,ÊÊ≤ ≥
$strÊÊ¥ ª
}ÊÊº Ω
)ÊÊΩ æ
;ÊÊæ ø
migrationBuilder
ËË 
.
ËË 
CreateIndex
ËË (
(
ËË( )
name
ÈÈ 
:
ÈÈ 
$str
ÈÈ 2
,
ÈÈ2 3
table
ÍÍ 
:
ÍÍ 
$str
ÍÍ )
,
ÍÍ) *
column
ÎÎ 
:
ÎÎ 
$str
ÎÎ  
)
ÎÎ  !
;
ÎÎ! "
migrationBuilder
ÌÌ 
.
ÌÌ 
CreateIndex
ÌÌ (
(
ÌÌ( )
name
ÓÓ 
:
ÓÓ 
$str
ÓÓ %
,
ÓÓ% &
table
ÔÔ 
:
ÔÔ 
$str
ÔÔ $
,
ÔÔ$ %
column
 
:
 
$str
 (
,
( )
unique
ÒÒ 
:
ÒÒ 
true
ÒÒ 
,
ÒÒ 
filter
ÚÚ 
:
ÚÚ 
$str
ÚÚ 6
)
ÚÚ6 7
;
ÚÚ7 8
migrationBuilder
ÙÙ 
.
ÙÙ 
CreateIndex
ÙÙ (
(
ÙÙ( )
name
ıı 
:
ıı 
$str
ıı 2
,
ıı2 3
table
ˆˆ 
:
ˆˆ 
$str
ˆˆ )
,
ˆˆ) *
column
˜˜ 
:
˜˜ 
$str
˜˜  
)
˜˜  !
;
˜˜! "
migrationBuilder
˘˘ 
.
˘˘ 
CreateIndex
˘˘ (
(
˘˘( )
name
˙˙ 
:
˙˙ 
$str
˙˙ 2
,
˙˙2 3
table
˚˚ 
:
˚˚ 
$str
˚˚ )
,
˚˚) *
column
¸¸ 
:
¸¸ 
$str
¸¸  
)
¸¸  !
;
¸¸! "
migrationBuilder
˛˛ 
.
˛˛ 
CreateIndex
˛˛ (
(
˛˛( )
name
ˇˇ 
:
ˇˇ 
$str
ˇˇ 1
,
ˇˇ1 2
table
ÄÄ 
:
ÄÄ 
$str
ÄÄ (
,
ÄÄ( )
column
ÅÅ 
:
ÅÅ 
$str
ÅÅ  
)
ÅÅ  !
;
ÅÅ! "
migrationBuilder
ÉÉ 
.
ÉÉ 
CreateIndex
ÉÉ (
(
ÉÉ( )
name
ÑÑ 
:
ÑÑ 
$str
ÑÑ "
,
ÑÑ" #
table
ÖÖ 
:
ÖÖ 
$str
ÖÖ $
,
ÖÖ$ %
column
ÜÜ 
:
ÜÜ 
$str
ÜÜ )
)
ÜÜ) *
;
ÜÜ* +
migrationBuilder
àà 
.
àà 
CreateIndex
àà (
(
àà( )
name
ââ 
:
ââ 
$str
ââ %
,
ââ% &
table
ää 
:
ää 
$str
ää $
,
ää$ %
column
ãã 
:
ãã 
$str
ãã ,
,
ãã, -
unique
åå 
:
åå 
true
åå 
,
åå 
filter
çç 
:
çç 
$str
çç :
)
çç: ;
;
çç; <
migrationBuilder
èè 
.
èè 
CreateIndex
èè (
(
èè( )
name
êê 
:
êê 
$str
êê 0
,
êê0 1
table
ëë 
:
ëë 
$str
ëë &
,
ëë& '
column
íí 
:
íí 
$str
íí !
)
íí! "
;
íí" #
migrationBuilder
îî 
.
îî 
CreateIndex
îî (
(
îî( )
name
ïï 
:
ïï 
$str
ïï /
,
ïï/ 0
table
ññ 
:
ññ 
$str
ññ &
,
ññ& '
column
óó 
:
óó 
$str
óó  
)
óó  !
;
óó! "
migrationBuilder
ôô 
.
ôô 
CreateIndex
ôô (
(
ôô( )
name
öö 
:
öö 
$str
öö 1
,
öö1 2
table
õõ 
:
õõ 
$str
õõ &
,
õõ& '
column
úú 
:
úú 
$str
úú "
,
úú" #
unique
ùù 
:
ùù 
true
ùù 
)
ùù 
;
ùù 
}
ûû 	
	protected
°° 
override
°° 
void
°° 
Down
°°  $
(
°°$ %
MigrationBuilder
°°% 5
migrationBuilder
°°6 F
)
°°F G
{
¢¢ 	
migrationBuilder
££ 
.
££ 
	DropTable
££ &
(
££& '
name
§§ 
:
§§ 
$str
§§ (
)
§§( )
;
§§) *
migrationBuilder
¶¶ 
.
¶¶ 
	DropTable
¶¶ &
(
¶¶& '
name
ßß 
:
ßß 
$str
ßß (
)
ßß( )
;
ßß) *
migrationBuilder
©© 
.
©© 
	DropTable
©© &
(
©©& '
name
™™ 
:
™™ 
$str
™™ (
)
™™( )
;
™™) *
migrationBuilder
¨¨ 
.
¨¨ 
	DropTable
¨¨ &
(
¨¨& '
name
≠≠ 
:
≠≠ 
$str
≠≠ '
)
≠≠' (
;
≠≠( )
migrationBuilder
ØØ 
.
ØØ 
	DropTable
ØØ &
(
ØØ& '
name
∞∞ 
:
∞∞ 
$str
∞∞ (
)
∞∞( )
;
∞∞) *
migrationBuilder
≤≤ 
.
≤≤ 
	DropTable
≤≤ &
(
≤≤& '
name
≥≥ 
:
≥≥ 
$str
≥≥ %
)
≥≥% &
;
≥≥& '
migrationBuilder
µµ 
.
µµ 
	DropTable
µµ &
(
µµ& '
name
∂∂ 
:
∂∂ 
$str
∂∂ #
)
∂∂# $
;
∂∂$ %
migrationBuilder
∏∏ 
.
∏∏ 
	DropTable
∏∏ &
(
∏∏& '
name
ππ 
:
ππ 
$str
ππ #
)
ππ# $
;
ππ$ %
migrationBuilder
ªª 
.
ªª 
	DropTable
ªª &
(
ªª& '
name
ºº 
:
ºº 
$str
ºº )
)
ºº) *
;
ºº* +
}
ΩΩ 	
}
ææ 
}øø »#
sC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Migrations\20250414212016_AddingFavoriteBlogPosts.cs
	namespace 	
	CodePulse
 
. 
API 
. 

Migrations "
{ 
public		 

partial		 
class		 #
AddingFavoriteBlogPosts		 0
:		1 2
	Migration		3 <
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str %
,% &
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
Guid& *
>* +
(+ ,
type, 0
:0 1
$str2 D
,D E
nullableF N
:N O
falseP U
)U V
,V W
UserId 
= 
table "
." #
Column# )
<) *
string* 0
>0 1
(1 2
type2 6
:6 7
$str8 G
,G H
nullableI Q
:Q R
falseS X
)X Y
,Y Z

BlogPostId 
=  
table! &
.& '
Column' -
<- .
Guid. 2
>2 3
(3 4
type4 8
:8 9
$str: L
,L M
nullableN V
:V W
falseX ]
)] ^
,^ _
FavoritedAt 
=  !
table" '
.' (
Column( .
<. /
DateTime/ 7
>7 8
(8 9
type9 =
:= >
$str? J
,J K
nullableL T
:T U
falseV [
)[ \
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 7
,7 8
x9 :
=>; =
x> ?
.? @
Id@ B
)B C
;C D
table 
. 

ForeignKey $
($ %
name 
: 
$str C
,C D
column 
: 
x  !
=>" $
x% &
.& '
UserId' -
,- .
principalTable &
:& '
$str( 5
,5 6
principalColumn '
:' (
$str) -
,- .
onDelete  
:  !
ReferentialAction" 3
.3 4
Restrict4 <
)< =
;= >
table   
.   

ForeignKey   $
(  $ %
name!! 
:!! 
$str!! E
,!!E F
column"" 
:"" 
x""  !
=>""" $
x""% &
.""& '

BlogPostId""' 1
,""1 2
principalTable## &
:##& '
$str##( 3
,##3 4
principalColumn$$ '
:$$' (
$str$$) -
,$$- .
onDelete%%  
:%%  !
ReferentialAction%%" 3
.%%3 4
Cascade%%4 ;
)%%; <
;%%< =
}&& 
)&& 
;&& 
migrationBuilder(( 
.(( 
CreateIndex(( (
(((( )
name)) 
:)) 
$str)) 3
,))3 4
table** 
:** 
$str** &
,**& '
column++ 
:++ 
$str++ $
)++$ %
;++% &
migrationBuilder-- 
.-- 
CreateIndex-- (
(--( )
name.. 
:.. 
$str.. /
,../ 0
table// 
:// 
$str// &
,//& '
column00 
:00 
$str00  
)00  !
;00! "
}11 	
	protected44 
override44 
void44 
Down44  $
(44$ %
MigrationBuilder44% 5
migrationBuilder446 F
)44F G
{55 	
migrationBuilder66 
.66 
	DropTable66 &
(66& '
name77 
:77 
$str77 %
)77% &
;77& '
}88 	
}99 
}:: é$
C:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Migrations\20250413024015_AddUserProfileBlogPostsRelationship.cs
	namespace 	
	CodePulse
 
. 
API 
. 

Migrations "
{ 
public 

partial 
class /
#AddUserProfileBlogPostsRelationship <
:= >
	Migration? H
{		 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
DropForeignKey +
(+ ,
name 
: 
$str 9
,9 :
table 
: 
$str "
)" #
;# $
migrationBuilder 
. 
DropPrimaryKey +
(+ ,
name 
: 
$str %
,% &
table 
: 
$str #
)# $
;$ %
migrationBuilder 
. 
RenameTable (
(( )
name 
: 
$str "
," #
newName 
: 
$str %
)% &
;& '
migrationBuilder 
. 
RenameIndex (
(( )
name 
: 
$str .
,. /
table 
: 
$str #
,# $
newName 
: 
$str 1
)1 2
;2 3
migrationBuilder!! 
.!! 
AddPrimaryKey!! *
(!!* +
name"" 
:"" 
$str"" %
,""% &
table## 
:## 
$str## #
,### $
column$$ 
:$$ 
$str$$ 
)$$ 
;$$ 
migrationBuilder'' 
.'' 
AddForeignKey'' *
(''* +
name(( 
:(( 
$str(( 9
,((9 :
table)) 
:)) 
$str)) "
,))" #
column** 
:** 
$str** "
,**" #
principalTable++ 
:++ 
$str++  -
,++- .
principalColumn,, 
:,,  
$str,,! %
,,,% &
onDelete-- 
:-- 
ReferentialAction-- +
.--+ ,
Cascade--, 3
)--3 4
;--4 5
}.. 	
	protected11 
override11 
void11 
Down11  $
(11$ %
MigrationBuilder11% 5
migrationBuilder116 F
)11F G
{22 	
migrationBuilder33 
.33 
DropForeignKey33 +
(33+ ,
name44 
:44 
$str44 9
,449 :
table55 
:55 
$str55 "
)55" #
;55# $
migrationBuilder77 
.77 
DropPrimaryKey77 +
(77+ ,
name88 
:88 
$str88 %
,88% &
table99 
:99 
$str99 #
)99# $
;99$ %
migrationBuilder== 
.== 
RenameTable== (
(==( )
name>> 
:>> 
$str>> "
,>>" #
newName?? 
:?? 
$str?? %
)??% &
;??& '
migrationBuilderCC 
.CC 
RenameIndexCC (
(CC( )
nameDD 
:DD 
$strDD .
,DD. /
tableEE 
:EE 
$strEE #
,EE# $
newNameFF 
:FF 
$strFF 1
)FF1 2
;FF2 3
migrationBuilderHH 
.HH 
AddPrimaryKeyHH *
(HH* +
nameII 
:II 
$strII %
,II% &
tableJJ 
:JJ 
$strJJ #
,JJ# $
columnKK 
:KK 
$strKK 
)KK 
;KK 
migrationBuilderOO 
.OO 
AddForeignKeyOO *
(OO* +
namePP 
:PP 
$strPP 9
,PP9 :
tableQQ 
:QQ 
$strQQ "
,QQ" #
columnRR 
:RR 
$strRR "
,RR" #
principalTableSS 
:SS 
$strSS  -
,SS- .
principalColumnTT 
:TT  
$strTT! %
,TT% &
onDeleteUU 
:UU 
ReferentialActionUU +
.UU+ ,
RestrictUU, 4
)UU4 5
;UU5 6
}VV 	
}WW 
}XX ∞w
pC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Migrations\20250407204048_AddUpdateUserProfile.cs
	namespace 	
	CodePulse
 
. 
API 
. 

Migrations "
{ 
public		 

partial		 
class		  
AddUpdateUserProfile		 -
:		. /
	Migration		0 9
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str "
," #
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
Guid& *
>* +
(+ ,
type, 0
:0 1
$str2 D
,D E
nullableF N
:N O
falseP U
)U V
,V W
FileName 
= 
table $
.$ %
Column% +
<+ ,
string, 2
>2 3
(3 4
type4 8
:8 9
$str: I
,I J
nullableK S
:S T
falseU Z
)Z [
,[ \
FileExtension !
=" #
table$ )
.) *
Column* 0
<0 1
string1 7
>7 8
(8 9
type9 =
:= >
$str? N
,N O
nullableP X
:X Y
falseZ _
)_ `
,` a
Title 
= 
table !
.! "
Column" (
<( )
string) /
>/ 0
(0 1
type1 5
:5 6
$str7 F
,F G
nullableH P
:P Q
falseR W
)W X
,X Y
Url 
= 
table 
.  
Column  &
<& '
string' -
>- .
(. /
type/ 3
:3 4
$str5 D
,D E
nullableF N
:N O
falseP U
)U V
,V W
DateCreated 
=  !
table" '
.' (
Column( .
<. /
DateTime/ 7
>7 8
(8 9
type9 =
:= >
$str? J
,J K
nullableL T
:T U
falseV [
)[ \
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 4
,4 5
x6 7
=>8 :
x; <
.< =
Id= ?
)? @
;@ A
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str !
,! "
columns   
:   
table   
=>   !
new  " %
{!! 
Id"" 
="" 
table"" 
."" 
Column"" %
<""% &
Guid""& *
>""* +
(""+ ,
type"", 0
:""0 1
$str""2 D
,""D E
nullable""F N
:""N O
false""P U
)""U V
,""V W
Title## 
=## 
table## !
.##! "
Column##" (
<##( )
string##) /
>##/ 0
(##0 1
type##1 5
:##5 6
$str##7 F
,##F G
nullable##H P
:##P Q
false##R W
)##W X
,##X Y
ShortDescription$$ $
=$$% &
table$$' ,
.$$, -
Column$$- 3
<$$3 4
string$$4 :
>$$: ;
($$; <
type$$< @
:$$@ A
$str$$B Q
,$$Q R
nullable$$S [
:$$[ \
false$$] b
)$$b c
,$$c d
Content%% 
=%% 
table%% #
.%%# $
Column%%$ *
<%%* +
string%%+ 1
>%%1 2
(%%2 3
type%%3 7
:%%7 8
$str%%9 H
,%%H I
nullable%%J R
:%%R S
false%%T Y
)%%Y Z
,%%Z [
FeaturedImageUrl&& $
=&&% &
table&&' ,
.&&, -
Column&&- 3
<&&3 4
string&&4 :
>&&: ;
(&&; <
type&&< @
:&&@ A
$str&&B Q
,&&Q R
nullable&&S [
:&&[ \
false&&] b
)&&b c
,&&c d
	UrlHandle'' 
='' 
table''  %
.''% &
Column''& ,
<'', -
string''- 3
>''3 4
(''4 5
type''5 9
:''9 :
$str''; J
,''J K
nullable''L T
:''T U
false''V [
)''[ \
,''\ ]
PublishedDate(( !
=((" #
table(($ )
.(() *
Column((* 0
<((0 1
DateTime((1 9
>((9 :
(((: ;
type((; ?
:((? @
$str((A L
,((L M
nullable((N V
:((V W
false((X ]
)((] ^
,((^ _
	IsVisible)) 
=)) 
table))  %
.))% &
Column))& ,
<)), -
bool))- 1
>))1 2
())2 3
type))3 7
:))7 8
$str))9 >
,))> ?
nullable))@ H
:))H I
false))J O
)))O P
,))P Q
	ViewCount** 
=** 
table**  %
.**% &
Column**& ,
<**, -
int**- 0
>**0 1
(**1 2
type**2 6
:**6 7
$str**8 =
,**= >
nullable**? G
:**G H
false**I N
)**N O
,**O P
AuthorId++ 
=++ 
table++ $
.++$ %
Column++% +
<+++ ,
string++, 2
>++2 3
(++3 4
type++4 8
:++8 9
$str++: I
,++I J
nullable++K S
:++S T
false++U Z
)++Z [
},, 
,,, 
constraints-- 
:-- 
table-- "
=>--# %
{.. 
table// 
.// 

PrimaryKey// $
(//$ %
$str//% 3
,//3 4
x//5 6
=>//7 9
x//: ;
.//; <
Id//< >
)//> ?
;//? @
table00 
.00 

ForeignKey00 $
(00$ %
name11 
:11 
$str11 A
,11A B
column22 
:22 
x22  !
=>22" $
x22% &
.22& '
AuthorId22' /
,22/ 0
principalTable33 &
:33& '
$str33( 5
,335 6
principalColumn44 '
:44' (
$str44) -
,44- .
onDelete55  
:55  !
ReferentialAction55" 3
.553 4
Restrict554 <
)55< =
;55= >
}66 
)66 
;66 
migrationBuilder88 
.88 
CreateTable88 (
(88( )
name99 
:99 
$str99 "
,99" #
columns:: 
::: 
table:: 
=>:: !
new::" %
{;; 
Id<< 
=<< 
table<< 
.<< 
Column<< %
<<<% &
Guid<<& *
><<* +
(<<+ ,
type<<, 0
:<<0 1
$str<<2 D
,<<D E
nullable<<F N
:<<N O
false<<P U
)<<U V
,<<V W
Name== 
=== 
table==  
.==  !
Column==! '
<==' (
string==( .
>==. /
(==/ 0
type==0 4
:==4 5
$str==6 E
,==E F
nullable==G O
:==O P
false==Q V
)==V W
,==W X
	UrlHandle>> 
=>> 
table>>  %
.>>% &
Column>>& ,
<>>, -
string>>- 3
>>>3 4
(>>4 5
type>>5 9
:>>9 :
$str>>; J
,>>J K
nullable>>L T
:>>T U
false>>V [
)>>[ \
}?? 
,?? 
constraints@@ 
:@@ 
table@@ "
=>@@# %
{AA 
tableBB 
.BB 

PrimaryKeyBB $
(BB$ %
$strBB% 4
,BB4 5
xBB6 7
=>BB8 :
xBB; <
.BB< =
IdBB= ?
)BB? @
;BB@ A
}CC 
)CC 
;CC 
migrationBuilderEE 
.EE 
CreateTableEE (
(EE( )
nameFF 
:FF 
$strFF (
,FF( )
columnsGG 
:GG 
tableGG 
=>GG !
newGG" %
{HH 
IdII 
=II 
tableII 
.II 
ColumnII %
<II% &
GuidII& *
>II* +
(II+ ,
typeII, 0
:II0 1
$strII2 D
,IID E
nullableIIF N
:IIN O
falseIIP U
)IIU V
,IIV W
FileNameJJ 
=JJ 
tableJJ $
.JJ$ %
ColumnJJ% +
<JJ+ ,
stringJJ, 2
>JJ2 3
(JJ3 4
typeJJ4 8
:JJ8 9
$strJJ: I
,JJI J
nullableJJK S
:JJS T
falseJJU Z
)JJZ [
,JJ[ \
FileExtensionKK !
=KK" #
tableKK$ )
.KK) *
ColumnKK* 0
<KK0 1
stringKK1 7
>KK7 8
(KK8 9
typeKK9 =
:KK= >
$strKK? N
,KKN O
nullableKKP X
:KKX Y
falseKKZ _
)KK_ `
,KK` a
UrlLL 
=LL 
tableLL 
.LL  
ColumnLL  &
<LL& '
stringLL' -
>LL- .
(LL. /
typeLL/ 3
:LL3 4
$strLL5 D
,LLD E
nullableLLF N
:LLN O
falseLLP U
)LLU V
}MM 
,MM 
constraintsNN 
:NN 
tableNN "
=>NN# %
{OO 
tablePP 
.PP 

PrimaryKeyPP $
(PP$ %
$strPP% :
,PP: ;
xPP< =
=>PP> @
xPPA B
.PPB C
IdPPC E
)PPE F
;PPF G
}QQ 
)QQ 
;QQ 
migrationBuilderSS 
.SS 
CreateTableSS (
(SS( )
nameTT 
:TT 
$strTT (
,TT( )
columnsUU 
:UU 
tableUU 
=>UU !
newUU" %
{VV 
BlogPostsIdWW 
=WW  !
tableWW" '
.WW' (
ColumnWW( .
<WW. /
GuidWW/ 3
>WW3 4
(WW4 5
typeWW5 9
:WW9 :
$strWW; M
,WWM N
nullableWWO W
:WWW X
falseWWY ^
)WW^ _
,WW_ `
CategoriesIdXX  
=XX! "
tableXX# (
.XX( )
ColumnXX) /
<XX/ 0
GuidXX0 4
>XX4 5
(XX5 6
typeXX6 :
:XX: ;
$strXX< N
,XXN O
nullableXXP X
:XXX Y
falseXXZ _
)XX_ `
}YY 
,YY 
constraintsZZ 
:ZZ 
tableZZ "
=>ZZ# %
{[[ 
table\\ 
.\\ 

PrimaryKey\\ $
(\\$ %
$str\\% :
,\\: ;
x\\< =
=>\\> @
new\\A D
{\\E F
x\\G H
.\\H I
BlogPostsId\\I T
,\\T U
x\\V W
.\\W X
CategoriesId\\X d
}\\e f
)\\f g
;\\g h
table]] 
.]] 

ForeignKey]] $
(]]$ %
name^^ 
:^^ 
$str^^ I
,^^I J
column__ 
:__ 
x__  !
=>__" $
x__% &
.__& '
BlogPostsId__' 2
,__2 3
principalTable`` &
:``& '
$str``( 3
,``3 4
principalColumnaa '
:aa' (
$straa) -
,aa- .
onDeletebb  
:bb  !
ReferentialActionbb" 3
.bb3 4
Cascadebb4 ;
)bb; <
;bb< =
tablecc 
.cc 

ForeignKeycc $
(cc$ %
namedd 
:dd 
$strdd K
,ddK L
columnee 
:ee 
xee  !
=>ee" $
xee% &
.ee& '
CategoriesIdee' 3
,ee3 4
principalTableff &
:ff& '
$strff( 4
,ff4 5
principalColumngg '
:gg' (
$strgg) -
,gg- .
onDeletehh  
:hh  !
ReferentialActionhh" 3
.hh3 4
Cascadehh4 ;
)hh; <
;hh< =
}ii 
)ii 
;ii 
migrationBuilderkk 
.kk 
CreateIndexkk (
(kk( )
namell 
:ll 
$strll .
,ll. /
tablemm 
:mm 
$strmm #
,mm# $
columnnn 
:nn 
$strnn "
,nn" #
uniqueoo 
:oo 
trueoo 
)oo 
;oo 
migrationBuilderqq 
.qq 
CreateIndexqq (
(qq( )
namerr 
:rr 
$strrr 8
,rr8 9
tabless 
:ss 
$strss )
,ss) *
columntt 
:tt 
$strtt &
)tt& '
;tt' (
migrationBuildervv 
.vv 
CreateIndexvv (
(vv( )
nameww 
:ww 
$strww -
,ww- .
tablexx 
:xx 
$strxx "
,xx" #
columnyy 
:yy 
$stryy "
)yy" #
;yy# $
}zz 	
	protected}} 
override}} 
void}} 
Down}}  $
(}}$ %
MigrationBuilder}}% 5
migrationBuilder}}6 F
)}}F G
{~~ 	
migrationBuilder 
. 
	DropTable &
(& '
name
ÄÄ 
:
ÄÄ 
$str
ÄÄ "
)
ÄÄ" #
;
ÄÄ# $
migrationBuilder
ÇÇ 
.
ÇÇ 
	DropTable
ÇÇ &
(
ÇÇ& '
name
ÉÉ 
:
ÉÉ 
$str
ÉÉ (
)
ÉÉ( )
;
ÉÉ) *
migrationBuilder
ÖÖ 
.
ÖÖ 
	DropTable
ÖÖ &
(
ÖÖ& '
name
ÜÜ 
:
ÜÜ 
$str
ÜÜ (
)
ÜÜ( )
;
ÜÜ) *
migrationBuilder
àà 
.
àà 
	DropTable
àà &
(
àà& '
name
ââ 
:
ââ 
$str
ââ !
)
ââ! "
;
ââ" #
migrationBuilder
ãã 
.
ãã 
	DropTable
ãã &
(
ãã& '
name
åå 
:
åå 
$str
åå "
)
åå" #
;
åå# $
}
çç 	
}
éé 
}èè ı7
\C:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Mapping\UserMappingProfile.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Mapping 
{ 
public 

class 
UserMappingProfile #
:$ %
Profile& -
{ 
public		 
UserMappingProfile		 !
(		! "
)		" #
{

 	
	CreateMap 
< 
UserProfile !
,! "
RegisterResponseDto# 6
>6 7
(7 8
)8 9
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
Id( *
,* +
opt, /
=>0 2
opt3 6
.6 7
MapFrom7 >
(> ?
src? B
=>C E
srcF I
.I J
IdJ L
)L M
)M N
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
UserName( 0
,0 1
opt2 5
=>6 8
opt9 <
.< =
MapFrom= D
(D E
srcE H
=>I K
srcL O
.O P
UserNameP X
)X Y
)Y Z
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
Email( -
,- .
opt/ 2
=>3 5
opt6 9
.9 :
MapFrom: A
(A B
srcB E
=>F H
srcI L
.L M
EmailM R
)R S
)S T
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
FullName( 0
,0 1
opt2 5
=>6 8
opt9 <
.< =
MapFrom= D
(D E
srcE H
=>I K
srcL O
.O P
FullNameP X
)X Y
)Y Z
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
Bio( +
,+ ,
opt- 0
=>1 3
opt4 7
.7 8
MapFrom8 ?
(? @
src@ C
=>D F
srcG J
.J K
BioK N
)N O
)O P
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
	Interests( 1
,1 2
opt3 6
=>7 9
opt: =
.= >
MapFrom> E
(E F
srcF I
=>J L
srcM P
.P Q
	InterestsQ Z
)Z [
)[ \
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
ImageUrl( 0
,0 1
opt2 5
=>6 8
opt9 <
.< =
MapFrom= D
(D E
srcE H
=>I K
srcL O
.O P
ImageP U
!=V X
nullY ]
?^ _
src` c
.c d
Imaged i
.i j
Urlj m
:n o
nullp t
)t u
)u v
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
Role( ,
,, -
opt. 1
=>2 4
opt5 8
.8 9
MapFrom9 @
(@ A
srcA D
=>E G
$strH N
)N O
)O P
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
Message( /
,/ 0
opt1 4
=>5 7
opt8 ;
.; <
MapFrom< C
(C D
srcD G
=>H J
$strK k
)k l
)l m
;m n
	CreateMap 
< 
UserProfile !
,! "
UserProfileDto# 1
>1 2
(2 3
)3 4
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
Email( -
,- .
opt/ 2
=>3 5
opt6 9
.9 :
MapFrom: A
(A B
srcB E
=>F H
srcI L
.L M
EmailM R
)R S
)S T
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
UserName( 0
,0 1
opt2 5
=>6 8
opt9 <
.< =
MapFrom= D
(D E
srcE H
=>I K
srcL O
.O P
UserNameP X
)X Y
)Y Z
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
ImageUrl( 0
,0 1
opt2 5
=>6 8
opt9 <
.< =
MapFrom= D
(D E
srcE H
=>I K
srcL O
.O P
ImageP U
!=V X
nullY ]
?^ _
src` c
.c d
Imaged i
.i j
Urlj m
:n o
nullp t
)t u
)u v
;v w
	CreateMap 
<  
CreateUserRequestDto *
,* +
UserProfile, 7
>7 8
(8 9
)9 :
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
Id( *
,* +
opt, /
=>0 2
opt3 6
.6 7
MapFrom7 >
(> ?
src? B
=>C E
GuidF J
.J K
NewGuidK R
(R S
)S T
)T U
)U V
;V W
	CreateMap"" 
<""  
UpdateUserRequestDto"" *
,""* +
UserProfile"", 7
>""7 8
(""8 9
)""9 :
;"": ;
	CreateMap%% 
<%% '
UpdateUserProfileRequestDto%% 1
,%%1 2
UserProfile%%3 >
>%%> ?
(%%? @
)%%@ A
;%%A B
	CreateMap&& 
<&& 
UserProfile&& !
,&&! "(
UpdateUserProfileResponseDto&&# ?
>&&? @
(&&@ A
)&&A B
;&&B C
	CreateMap'' 
<'' 
UserImageProfile'' &
,''& '
UserImageProfileDto''( ;
>''; <
(''< =
)''= >
;''> ?
	CreateMap,, 
<,, $
CreateBlogPostRequestDto,, .
,,,. /
BlogPost,,0 8
>,,8 9
(,,9 :
),,: ;
;,,; <
	CreateMap-- 
<-- $
UpdateBlogPostRequestDto-- .
,--. /
BlogPost--0 8
>--8 9
(--9 :
)--: ;
;--; <
}.. 	
}// 
}00 Ç	
`C:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Mapping\CategoryMappingProfile.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Mapping 
{ 
public 
class	 "
CategoryMappingProfile %
:& '
Profile( /
{ 
public		 "
CategoryMappingProfile		 #
(		# $
)		$ %
{

 
	CreateMap 
< 
CreateCategoriesDto #
,# $
Category% -
>- .
(. /
)/ 0
;0 1
	CreateMap 
< $
UpdateCategoryRequestDto (
,( )
Category* 2
>2 3
(3 4
)4 5
;5 6
	CreateMap 
< 
CategoryDto 
, 
Category %
>% &
(& '
)' (
;( )
	CreateMap 
< 
Category 
, 
CategoryDto %
>% &
(& '
)' (
;( )
} 
} 
} Ê
`C:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Mapping\BlogPostMappingProfile.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Mapping 
{ 
public 
class	 "
BlogPostMappingProfile %
:& '
Profile( /
{ 
public		 
"
BlogPostMappingProfile		 !
(		! "
)		" #
{

 
Console 
. 
	WriteLine 
( 
$str >
)> ?
;? @
	CreateMap 
< $
CreateBlogPostRequestDto (
,( )
BlogPost* 2
>2 3
(3 4
)4 5
. 	
	ForMember	 
( 
dest 
=> 
dest 
.  

Categories  *
,* +
opt, /
=>0 2
opt3 6
.6 7
Ignore7 =
(= >
)> ?
)? @
. 	
	ForMember	 
( 
dest 
=> 
dest 
.  
AuthorId  (
,( )
opt* -
=>. 0
opt1 4
.4 5
Ignore5 ;
(; <
)< =
)= >
. 	
	ForMember	 
( 
dest 
=> 
dest 
.  
	ViewCount  )
,) *
opt+ .
=>/ 1
opt2 5
.5 6
MapFrom6 =
(= >
src> A
=>B D
$numE F
)F G
)G H
. 	
	ForMember	 
( 
dest 
=> 
dest 
.  
Id  "
," #
opt$ '
=>( *
opt+ .
.. /
MapFrom/ 6
(6 7
src7 :
=>; =
Guid> B
.B C
NewGuidC J
(J K
)K L
)L M
)M N
;N O
	CreateMap 
< $
UpdateBlogPostRequestDto (
,( )
BlogPost* 2
>2 3
(3 4
)4 5
. 	
	ForMember	 
( 
dest 
=> 
dest 
.  

Categories  *
,* +
opt, /
=>0 2
opt3 6
.6 7
Ignore7 =
(= >
)> ?
)? @
. 	
	ForMember	 
( 
dest 
=> 
dest 
.  
AuthorId  (
,( )
opt* -
=>. 0
opt1 4
.4 5
Ignore5 ;
(; <
)< =
)= >
. 	
	ForMember	 
( 
dest 
=> 
dest 
.  
	ViewCount  )
,) *
opt+ .
=>/ 1
opt2 5
.5 6
Ignore6 <
(< =
)= >
)> ?
;? @
	CreateMap 
< 
	BlogImage 
, 
BlogImageDto '
>' (
(( )
)) *
;* +
	CreateMap 
< 
UserImageProfileDto #
,# $
UserImageProfile% 5
>5 6
(6 7
)7 8
;8 9
	CreateMap 
< 
Category 
, 
CategoryDto %
>% &
(& '
)' (
;( )
	CreateMap 
< 
UserImageProfile  
,  !
UserImageProfileDto" 5
>5 6
(6 7
)7 8
;8 9
}!! 
}"" 
}## ç
`C:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Helper\UserProfileMapperHelper.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Helper 
; 
public 
static 
class #
UserProfileMapperHelper +
{ 
public 
static	 
UserProfileDto 
MapToDto '
(' (
UserProfile( 3
profile4 ;
,; <
HttpRequest= H
requestI P
,P Q
stringR X
roleY ]
)] ^
{ 
return		 
new		 
UserProfileDto		 !
{

 	
Id 
= 
profile 
. 
Id 
, 
UserName 
= 
profile 
. 
UserName '
,' (
FullName 
= 
profile 
. 
FullName '
,' (
Email 
= 
profile 
. 
Email !
,! "
Bio 
= 
profile 
. 
Bio 
, 
	Interests 
= 
profile 
.  
	Interests  )
,) *
Role 
= 
role 
, 
ImageUrl 
= 
profile 
. 
Image $
?$ %
.% &
Url& )
} 	
;	 

} 
public 
static	 
void 
MapToDomain  
(! "
UserProfile# .
profile/ 6
,6 7'
UpdateUserProfileRequestDto8 S
requestT [
)\ ]
{ 
profile 
. 
FullName 
= 
request 
. 
FullName '
;' (
profile 
. 
UserName 
= 
request 
. 
UserName '
;' (
profile 
. 
Bio 
= 
request 
. 
Bio 
; 
profile 
. 
	Interests 
= 
request 
.  
	Interests  )
;) *
} 
} û
aC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Helper\FavoritePostMapperHelper.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Helper 
{ 
public 

static 
class 
FavoritePostMapper *
{ 
public 
static 
FavoritePostDto %
ToDto& +
(+ ,
FavoritePost, 8
favorite9 A
)A B
{		 	
return

 
new

 
FavoritePostDto

 &
{ 
Id 
= 
favorite 
. 
Id  
,  !
UserId 
= 
favorite !
.! "
UserId" (
,( )

BlogPostId 
= 
favorite %
.% &

BlogPostId& 0
,0 1
BlogPostTitle 
= 
favorite  (
.( )
BlogPost) 1
?1 2
.2 3
Title3 8
??9 ;
$str< >
,> ?
BlogPostUrlHandle !
=" #
favorite$ ,
., -
BlogPost- 5
?5 6
.6 7
	UrlHandle7 @
??A C
$strD F
,F G
BlogPostImageUrl  
=! "
favorite# +
.+ ,
BlogPost, 4
?4 5
.5 6
FeaturedImageUrl6 F
??G I
$strJ L
,L M
AuthorUserName 
=  
favorite! )
.) *
BlogPost* 2
?2 3
.3 4
AuthorProfile4 A
?A B
.B C
UserNameC K
??L N
$strO Q
,Q R
AuthorImageUrl 
=  !
favorite" *
.* +
BlogPost+ 3
.3 4
AuthorProfile4 A
.A B
ImageB G
?G H
.H I
UrlI L
,L M
FavoritedAt 
= 
favorite &
.& '
FavoritedAt' 2
} 
; 
} 	
} 
} ™1
]C:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Helper\BlogPostMapperHelper.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Helper 
; 
public 
static 
class  
BlogPostMapperHelper (
{ 
public 
static	 
BlogPostDto 
MapToDto $
($ %
BlogPost% -
post. 2
)2 3
{		 
return

 
new

	 
BlogPostDto

 
{ 
Id 
= 
post	 
. 
Id 
, 
Title 	
=
 
post 
. 
Title 
, 
ShortDescription 
= 
post 
. 
ShortDescription ,
,, -
Content 
= 
post 
. 
Content 
, 
FeaturedImageUrl 
= 
post 
. 
FeaturedImageUrl ,
,, -
	UrlHandle 
= 
post 
. 
	UrlHandle 
, 
PublishedDate 
= 
post 
. 
PublishedDate &
,& '
	IsVisible 
= 
post 
. 
	IsVisible 
, 
	ViewCount 
= 
post 
. 
	ViewCount 
, 

Categories 
= 
post 
. 

Categories  
.  !
Select! '
(' (
c( )
=>* ,
new- 0
CategoryDto1 <
{ 
Id 
=	 

c 
. 
Id 
, 
Name 

= 
c 
. 
Name 
, 
	UrlHandle 
= 
c 
. 
	UrlHandle 
} 
) 
. 
ToList 
( 
) 
, 
Author 

= 
post 
. 
AuthorProfile 
==  "
null# '
?( )
null* .
:/ 0
new1 4
BlogPostAuthorDto5 F
{ 
Id 
=	 

post 
. 
AuthorProfile 
. 
Id  
,  !
UserName   
=   
post   
.   
AuthorProfile   #
.  # $
UserName  $ ,
,  , -
FullName!! 
=!! 
post!! 
.!! 
AuthorProfile!! #
.!!# $
FullName!!$ ,
,!!, -
ImageUrl"" 
="" 
post"" 
."" 
AuthorProfile"" #
.""# $
Image""$ )
!=""* ,
null""- 1
?## 	
$"##
 
$str## #
{### $
post##$ (
.##( )
AuthorProfile##) 6
.##6 7
Image##7 <
.##< =
Url##= @
}##@ A
"##A B
:$$ 	
null$$
 
,$$ 
Bio'' 	
=''
 
post'' 
.'' 
AuthorProfile'' 
.'' 
Bio'' "
}(( 
})) 
;)) 
}** 
public,, 
static,,	 
async,, 
Task,, 
<,, 
BlogPost,, #
>,,# $
MapToDomainAsync,,% 5
(,,5 6$
CreateBlogPostRequestDto,,6 N
dto,,O R
,,,R S
string,,T Z
userId,,[ a
,,,a b
ICategoryRepository,,c v
categoryRepository	,,w â
)
,,â ä
{-- 
var.. 
blogPost.. 
=.. 
new.. 
BlogPost.. 
{// 
Id00 
=00	 

Guid00 
.00 
NewGuid00 
(00 
)00 
,00 
Title11 
=11 
dto11 
.11 
Title11 
,11 
ShortDescription22 
=22 
dto22 
.22 
ShortDescription22 -
,22- .
Content33 
=33 
dto33 
.33 
Content33 
,33 
FeaturedImageUrl44 
=44 
dto44 
.44 
FeaturedImageUrl44 -
,44- .
	UrlHandle55 
=55 
dto55 
.55 
	UrlHandle55 
,55  
PublishedDate66 
=66 
dto66 
.66 
PublishedDate66 '
,66' (
	IsVisible77 
=77 
dto77 
.77 
	IsVisible77 
,77  
	ViewCount88 
=88 
$num88 
,88 
AuthorId99 
=99 
userId99 
,99 

Categories:: 
=:: 
new:: 
List:: 
<:: 
Category:: $
>::$ %
(::% &
)::& '
};; 
;;; 
if== 
(== 
dto== 
.== 

Categories== 
!=== 
null== 
&&== !
dto==" %
.==% &

Categories==& 0
.==0 1
Any==1 4
(==4 5
)==5 6
)==6 7
{>> 
foreach?? 
(?? 
var?? 

categoryId?? 
in??  
dto??! $
.??$ %

Categories??% /
)??/ 0
{@@ 
varAA 
categoryAA 
=AA 
awaitAA 
categoryRepositoryAA /
.AA/ 0 
GetCategoryByIdAsyncAA0 D
(AAD E

categoryIdAAE O
)AAO P
;AAP Q
ifBB 

(BB 
categoryBB 
!=BB 
nullBB 
)BB 
{CC 	
blogPostDD
 
.DD 

CategoriesDD 
.DD 
AddDD !
(DD! "
categoryDD" *
)DD* +
;DD+ ,
}EE 	
}FF 
}GG 
returnII 

blogPostII 
;II 
}JJ 
}KK ¿$
eC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Extensions\IdentityServiceExtension.cs
	namespace		 	
	CodePulse		
 
.		 
API		 
.		 

Extensions		 "
{

 
public 
static	 
class $
IdentityServiceExtension .
{ 
public 

static 
IServiceCollection $
AddIdentityService% 7
(7 8
this8 <
IServiceCollection= O
servicesP X
,X Y
IConfiguration 
configuration "
)# $
{ 
services 
. 
AddDbContext 
< 
AuthContext '
>' (
() *
opt+ .
=>/ 1
{ 
opt 
. 
UseSqlServer 
( 
configuration (
.( )
GetConnectionString) <
(= >
$str? Z
)[ \
)] ^
;^ _
} 
) 	
;	 

services 
. 
AddIdentityCore 
< 
UserProfile *
>* +
(, -
). /
. 	
AddRoles	 
< 
IdentityRole 
> 
(  !
)" #
. 	
AddTokenProvider	 
< &
DataProtectorTokenProvider 4
<4 5
UserProfile5 @
>@ A
>A B
(C D
$strE P
)Q R
. 	$
AddEntityFrameworkStores	 !
<! "
AuthContext" -
>- .
(/ 0
)1 2
. 	$
AddDefaultTokenProviders	 !
(" #
)$ %
;% &
services 
. 
	Configure 
< 
IdentityOptions (
>( )
(* +
opt, /
=>0 2
{ 
opt 
. 
Password 
. 
RequireDigit !
=" #
false$ )
;) *
opt 
. 
Password 
. 
RequiredLength #
=$ %
$num& '
;' (
opt 
. 
Password 
. 
RequireLowercase %
=& '
false( -
;- .
opt 
. 
Password 
. "
RequireNonAlphanumeric +
=, -
false. 3
;3 4
opt   
.   
Password   
.   
RequireUppercase   %
=  & '
false  ( -
;  - .
opt!! 
.!! 
Password!! 
.!! 
RequiredUniqueChars!! (
=!!) *
$num!!+ ,
;!!, -
opt"" 
."" 
User"" 
."" 
RequireUniqueEmail"" #
=""$ %
true""& *
;""* +
}## 
)## 	
;##	 

services$$ 
.$$ 
AddAuthentication$$  
($$! "
JwtBearerDefaults$$# 4
.$$4 5 
AuthenticationScheme$$5 I
)$$J K
.%% 	
AddJwtBearer%%	 
(%% 
opt%% 
=>%% 
{&& 	
opt''
 
.'' %
TokenValidationParameters'' '
=''( )
new''* -%
TokenValidationParameters''. G
{((
 
AuthenticationType)) 
=))  
$str))! &
,))& '
ValidateIssuer** 
=** 
true** !
,**! "
ValidateAudience++ 
=++ 
true++ #
,++# $
ValidateLifetime,, 
=,, 
true,, #
,,,# $$
ValidateIssuerSigningKey-- $
=--% &
true--' +
,--+ ,
ValidIssuer.. 
=.. 
configuration.. '
[..( )
$str..) 5
]..5 6
,..6 7
ValidAudience// 
=// 
configuration// )
[//* +
$str//+ 9
]//9 :
,//: ;
IssuerSigningKey00 
=00 
new00 " 
SymmetricSecurityKey00# 7
(008 9
Encoding00: B
.00B C
UTF800C G
.00G H
GetBytes00H P
(00Q R
configuration11
 
[11 
$str11 "
]11" #
)22
 
)22 
}33
 
;33 
}44 	
)44
 
;44 
return66 
services66 
;66 
}77 
}99 
}:: £1
_C:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Extensions\ApplicationService.cs
	namespace 	
	CodePulse
 
. 
API 
. 

Extensions "
{		 
public

 
static

	 
class

 
ApplicationService

 (
{ 
public 

static 
IServiceCollection $"
AddApplicationServices% ;
(< =
this> B
IServiceCollectionC U
servicesV ^
,^ _
IConfiguration 
config 
) 
{ 
services 
. 
AddControllers 
( 
)  !
;! "
services 
. #
AddEndpointsApiExplorer &
(' (
)) *
;* +
services 
. 
AddAutoMapper 
( 
typeof #
(# $"
BlogPostMappingProfile$ :
): ;
); <
;< =
services 
. 
AddDbContext 
< 
ApplicationContext .
>. /
(0 1
opt2 5
=>6 8
{ 
opt 
. 
UseSqlServer 
( 
config 
.  
GetConnectionString  3
(4 5
$str6 Q
)R S
)T U
;U V
} 
) 	
;	 

services 
. 
AddSwaggerGen 
( 
options $
=>% '
{ 
options  
 
.   

SwaggerDoc   
(   
$str   !
,  ! "
new  # &
OpenApiInfo  ' 2
{  3 4
Title  5 :
=  ; <
$str  = L
,  L M
Version  N U
=  V W
$str  X \
}  ] ^
)  ^ _
;  _ `
options##
 
.## !
AddSecurityDefinition## '
(##' (
$str##( 0
,##0 1
new##2 5!
OpenApiSecurityScheme##6 K
{$$
 
Description%% 
=%% 
$str%% O
,%%O P
Name&& 
=&& 
$str&& $
,&&$ %
In'' 
='' 
ParameterLocation'' $
.''$ %
Header''% +
,''+ ,
Type(( 
=(( 
SecuritySchemeType(( '
.((' (
ApiKey((( .
,((. /
Scheme)) 
=)) 
$str)) 
}**
 
)** 
;** 
options,,
 
.,, "
AddSecurityRequirement,, (
(,,( )
new,,) ,&
OpenApiSecurityRequirement,,- G
(,,G H
),,H I
{--
 
{.. 
new// !
OpenApiSecurityScheme// +
{00 
	Reference11 
=11  !
new11" %
OpenApiReference11& 6
{117 8
Type119 =
=11> ?
ReferenceType11@ M
.11M N
SecurityScheme11N \
,11\ ]
Id11^ `
=11a b
$str11c k
}11l m
,11m n
Scheme22 
=22 
$str22 '
,22' (
Name33 
=33 
$str33 %
,33% &
In44 
=44 
ParameterLocation44 ,
.44, -
Header44- 3
,443 4
}55 
,55 
new66 
List66 
<66 
string66 !
>66! "
(66" #
)66# $
}77 
}88
 
)88 
;88 
var;;
 
xmlFile;; 
=;; 
$";; 
{;; 
System;; !
.;;! "

Reflection;;" ,
.;;, -
Assembly;;- 5
.;;5 6 
GetExecutingAssembly;;6 J
(;;J K
);;K L
.;;L M
GetName;;M T
(;;T U
);;U V
.;;V W
Name;;W [
};;[ \
$str;;\ `
";;` a
;;;a b
var<<
 
xmlPath<< 
=<< 
Path<< 
.<< 
Combine<< $
(<<$ %

AppContext<<% /
.<</ 0
BaseDirectory<<0 =
,<<= >
xmlFile<<? F
)<<F G
;<<G H
options==
 
.== 
IncludeXmlComments== $
(==$ %
xmlPath==% ,
)==, -
;==- .
}>> 
)>> 
;>> 	
services@@ 
.@@ 
	AddScoped@@ 
<@@ 
ICategoryRepository@@ ,
,@@, -
CategoryRepository@@. @
>@@@ A
(@@B C
)@@D E
;@@E F
servicesAA 
.AA 
	AddScopedAA 
<AA 
IBlogPostRepositoryAA ,
,AA, -
BlogPostRepositoryAA. @
>AA@ A
(AAB C
)AAD E
;AAE F
servicesBB 
.BB 
	AddScopedBB 
<BB 
IImageRepositoryBB )
,BB) *
ImageRepositoryBB+ :
>BB: ;
(BB< =
)BB> ?
;BB? @
servicesCC 
.CC 
	AddScopedCC 
<CC 
ITokenRepositoryCC )
,CC) *
TokenRepositoryCC+ :
>CC: ;
(CC< =
)CC> ?
;CC? @
servicesDD 
.DD 
	AddScopedDD 
<DD 
IUserRepositoryDD (
,DD( )
UserRepositoryDD* 8
>DD8 9
(DD9 :
)DD: ;
;DD; <
servicesEE 
.EE 
	AddScopedEE 
<EE '
IUserImageProfileRepositoryEE 4
,EE4 5&
UserImageProfileRepositoryEE6 P
>EEP Q
(EEQ R
)EER S
;EES T
servicesFF 
.FF 
	AddScopedFF 
<FF $
IUserManagmentRepositoryFF 1
,FF1 2$
UserManagementRepositoryFF3 K
>FFK L
(FFL M
)FFM N
;FFN O
servicesGG 
.GG 
	AddScopedGG 
<GG 
IFavoriteRepositoryGG ,
,GG, -
FavoriteRepositoryGG. @
>GG@ A
(GGB C
)GGD E
;GGE F
returnII 
servicesII 
;II 
}JJ 
}KK 
}LL Ü
RC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Data\AuthContext.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Data 
{ 
public 

class 
AuthContext 
: 
IdentityDbContext 0
<0 1
UserProfile1 <
>< =
{ 
public		 
DbSet		 
<		 
UserProfile		  
>		  !
UsersProfiles		" /
{		0 1
get		2 5
;		5 6
set		7 :
;		: ;
}		< =
public

 
DbSet

 
<

 
UserImageProfile

 %
>

% &
UserImageProfiles

' 8
{

9 :
get

; >
;

> ?
set

@ C
;

C D
}

E F
public 
AuthContext 
( 
DbContextOptions +
<+ ,
AuthContext, 7
>7 8
options9 @
)@ A
:B C
baseD H
(H I
optionsI P
)P Q
{ 	
} 	
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
builder= D
)D E
{ 	
base 
. 
OnModelCreating  
(  !
builder! (
)( )
;) *
builder 
. 
Entity 
< 
UserProfile &
>& '
(' (
)( )
. 
HasOne 
( 
u 
=> 
u 
. 
Image $
)$ %
. 
WithOne 
( 
) 
. 
HasForeignKey 
< 
UserProfile *
>* +
(+ ,
u, -
=>. 0
u1 2
.2 3
ImageId3 :
): ;
. 
OnDelete 
( 
DeleteBehavior (
.( )
SetNull) 0
)0 1
;1 2
} 	
} 
} ≈
]C:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Data\ApplicationContextSeed.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Data 
{ 
public 
class	 "
ApplicationContextSeed %
{		 
public

 

static

 
async

 
Task

 
	SeedAsync

 &
(

& '
ApplicationContext

' 9
applicationContext

: L
,

L M
UserManager

N Y
<

Y Z
UserProfile

Z e
>

e f
userManager

g r
)

r s
{ 
if 
(	 

! 
applicationContext 
. 

Categories )
.) *
Any* -
(. /
)0 1
)2 3
{ 
var 
categoriesData 
= 
File !
.! "
ReadAllText" -
(- .
$str. K
)K L
;L M
var 
options 
= 
new !
JsonSerializerOptions /
{0 1'
PropertyNameCaseInsensitive2 M
=N O
trueP T
}U V
;V W
var 

categories 
= 
JsonSerializer '
.' (
Deserialize( 3
<3 4
List4 8
<8 9
Category9 A
>A B
>B C
(C D
categoriesDataD R
,R S
optionsT [
)[ \
;\ ]
applicationContext 
. 

Categories %
.% &
AddRange& .
(. /

categories/ 9
)9 :
;: ;
} 
if 
(	 

! 
applicationContext 
. 
	BlogPosts (
.( )
Any) ,
(- .
)/ 0
)1 2
{ 
var 
	adminUser 
= 
await 
userManager )
.) *
FindByEmailAsync* :
(: ;
$str; P
)P Q
;Q R
if 

( 
	adminUser 
== 
null 
) 
{ 	
throw
 
new 
	Exception 
( 
$str x
)x y
;y z
} 	
var 
BlogPostsData 
= 
File  
.  !
ReadAllText! ,
(, -
$str- J
)J K
;K L
var 
options 
= 
new !
JsonSerializerOptions /
{0 1'
PropertyNameCaseInsensitive2 M
=N O
trueP T
}U V
;V W
var 
	blogPosts 
= 
JsonSerializer &
.& '
Deserialize' 2
<2 3
List3 7
<7 8
BlogPost8 @
>@ A
>A B
(B C
BlogPostsDataC P
,P Q
optionsR Y
)Y Z
;Z [
foreach   
(   
var   
post   
in   
	blogPosts   &
)  & '
{!! 	
post""
 
."" 
AuthorId"" 
="" 
	adminUser"" #
.""# $
Id""$ &
;""& '
}## 	
applicationContext%% 
.%% 
	BlogPosts%% $
.%%$ %
AddRange%%% -
(%%- .
	blogPosts%%. 7
)%%7 8
;%%8 9
}&& 
if'' 
('' 	
applicationContext''	 
.'' 
ChangeTracker'' )
.'') *

HasChanges''* 4
(''4 5
)''5 6
)''6 7
await(( 
applicationContext((  
.((  !
SaveChangesAsync((! 1
(((1 2
)((2 3
;((3 4
})) 
}** 
}++ ä3
YC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Data\ApplicationContext.cs
public 
class 
ApplicationContext 
:  !
	DbContext" +
{ 
public 
DbSet	 
< 
BlogPost 
> 
	BlogPosts "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
DbSet	 
< 
Category 
> 

Categories #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
DbSet	 
< 
	BlogImage 
> 

BlogImages $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public		 
DbSet			 
<		 
UserProfile		 
>		 
UsersProfiles		 )
{		* +
get		, /
;		/ 0
set		1 4
;		4 5
}		6 7
public

 
DbSet

	 
<

 
UserImageProfile

 
>

  
UserImageProfiles

! 2
{

3 4
get

5 8
;

8 9
set

: =
;

= >
}

? @
public 
DbSet	 
< 
FavoritePost 
> 
FavoritePosts *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
ApplicationContext	 
( 
DbContextOptions .
<. /
ApplicationContext/ A
>A B
optionsC J
)K L
:M N
baseO S
(T U
optionsV ]
)^ _
{` a
}b c
	protected 
override 
void 
OnModelCreating )
(* +
ModelBuilder, 8
modelBuilder9 E
)F G
{ 
base 
. 	
OnModelCreating	 
( 
modelBuilder '
)( )
;) *
modelBuilder 
. 
Entity 
< 
UserProfile #
># $
(% &
)' (
.( )
ToTable) 0
(1 2
$str3 @
,@ A
tB C
=>D F
tG H
.H I!
ExcludeFromMigrationsI ^
(_ `
)a b
)c d
;d e
modelBuilder 
. 
Entity 
< 
UserImageProfile (
>( )
(* +
), -
.- .
ToTable. 5
(6 7
$str8 K
,K L
tM N
=>O Q
tR S
.S T!
ExcludeFromMigrationsT i
(j k
)l m
)n o
;o p
modelBuilder 
. 
Entity 
< 
BlogPost  
>  !
(" #
)$ %
. 
HasOne 
(	 

b 
=> 
b 
. 
AuthorProfile 
)  !
. 
WithMany 

( 
up 
=> 
up 
. 
	BlogPosts 
)  !
. 
HasForeignKey 
( 
b 
=> 
b 
. 
AuthorId !
)" #
. 
OnDelete 

( 
DeleteBehavior 
. 
Cascade #
)$ %
;% &
modelBuilder"" 
."" 
Entity"" 
<"" 
	BlogImage"" !
>""! "
(""# $
)""% &
.""& '
HasIndex""' /
(""0 1
b""2 3
=>""4 6
b""7 8
.""8 9
FileName""9 A
)""B C
.""C D
IsUnique""D L
(""M N
)""O P
;""P Q
modelBuilder$$ 
.$$ 
Entity$$ 
<$$ 
BlogPost$$  
>$$  !
($$" #
)$$$ %
.%% 	
HasMany%%	 
(%% 
b%% 
=>%% 
b%% 
.%% 

Categories%% $
)%%% &
.&& 	
WithMany&&	 
(&& 
c&& 
=>&& 
c&& 
.&& 
	BlogPosts&& $
)&&% &
.'' 	
UsingEntity''	 
('' 
j'' 
=>'' 
j'' 
.'' 
ToTable'' %
(''& '
$str''( :
)''; <
)''= >
;''> ?
modelBuilder)) 
.)) 
Entity)) 
<)) 
FavoritePost)) $
>))$ %
())% &
)))& '
.** 
HasKey** 
(** 
fp** 
=>** 
fp** 
.** 
Id** 
)** 
;** 
modelBuilder++ 
.++ 
Entity++ 
<++ 
FavoritePost++ $
>++$ %
(++% &
)++& '
.,, 
HasOne,, 
(,, 
fp,, 
=>,, 
fp,, 
.,, 
User,, 
),, 
.-- 
WithMany-- 
(-- 
u-- 
=>-- 
u-- 
.-- 
FavoriteBlogPosts-- *
)--+ ,
... 
HasForeignKey.. 
(.. 
fp.. 
=>.. 
fp.. 
...  
UserId..  &
)..' (
.// 
OnDelete// 
(// 
DeleteBehavior// 
.// 
Restrict// '
)//( )
;//) *
modelBuilder11 
.11 
Entity11 
<11 
FavoritePost11 $
>11$ %
(11& '
)11( )
.22 
HasOne22 
(22 
fp22 
=>22 
fp22 
.22 
BlogPost22 !
)22" #
.33 
WithMany33 
(33 
bp33 
=>33 
bp33 
.33 
FavoriteBlogPosts33 ,
)33- .
.44 
HasForeignKey44 
(44 
fp44 
=>44 
fp44 
.44  

BlogPostId44  *
)44+ ,
.55 
OnDelete55 
(55 
DeleteBehavior55  
.55  !
Cascade55! (
)55) *
;55* +
}77 
}88 ï
gC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Controllers\WeatherForecastController.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Controllers #
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class %
WeatherForecastController *
:+ ,
ControllerBase- ;
{ 
private		 
static		 
readonly		 
string		  &
[		& '
]		' (
	Summaries		) 2
=		3 4
new		5 8
[		8 9
]		9 :
{

 	
$str 
, 
$str !
,! "
$str# +
,+ ,
$str- 3
,3 4
$str5 ;
,; <
$str= C
,C D
$strE L
,L M
$strN S
,S T
$strU a
,a b
$strc n
} 	
;	 

private 
readonly 
ILogger  
<  !%
WeatherForecastController! :
>: ;
_logger< C
;C D
public %
WeatherForecastController (
(( )
ILogger) 0
<0 1%
WeatherForecastController1 J
>J K
loggerL R
)R S
{ 	
_logger 
= 
logger 
; 
} 	
[ 	
HttpGet	 
( 
Name 
= 
$str ,
), -
]- .
public 
IEnumerable 
< 
WeatherForecast *
>* +
Get, /
(/ 0
)0 1
{ 	
return 

Enumerable 
. 
Range #
(# $
$num$ %
,% &
$num' (
)( )
.) *
Select* 0
(0 1
index1 6
=>7 9
new: =
WeatherForecast> M
{ 
Date 
= 
DateOnly 
.  
FromDateTime  ,
(, -
DateTime- 5
.5 6
Now6 9
.9 :
AddDays: A
(A B
indexB G
)G H
)H I
,I J
TemperatureC 
= 
Random %
.% &
Shared& ,
., -
Next- 1
(1 2
-2 3
$num3 5
,5 6
$num7 9
)9 :
,: ;
Summary 
= 
	Summaries #
[# $
Random$ *
.* +
Shared+ 1
.1 2
Next2 6
(6 7
	Summaries7 @
.@ A
LengthA G
)G H
]H I
} 
) 
. 
ToArray 
( 
) 
; 
} 	
}   
}!! ◊Ñ
cC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Controllers\UserProfileController.cs
[ 
Route 
( 
$str 
) 
] 
[ 
ApiController 
] 
public 
class !
UserProfileController "
:# $
ControllerBase% 3
{ 
private 
readonly 
IUserRepository $
_userRepository% 4
;4 5
private 
readonly 
AuthContext  
_authContext! -
;- .
private 
readonly 
UserManager  
<  !
UserProfile! ,
>, -
_userManager. :
;: ;
public 
!
UserProfileController  
(  !
IUserRepository 
userRepository &
,& '
AuthContext 
authContext 
,  
UserManager 
< 
UserProfile 
>  
userManager! ,
,, -'
IUserImageProfileRepository #
userImageRepository$ 7
,7 8
IMapper 
mapper 
) 
{ 
_userRepository 
= 
userRepository (
;( )
_authContext 
= 
authContext "
;" #
_userManager 
= 
userManager "
;" #
}!! 
[$$ 
HttpGet$$ 
($$ 
$str$$ 
)$$ 
]$$ 
public%% 

async%% 
Task%% 
<%% 
IActionResult%% #
>%%# $
GetUserProfile%%% 3
(%%3 4
string%%4 :
userId%%; A
)%%A B
{&& 
var'' 
profile'' 
='' 
await'' 
_userRepository'' +
.''+ ,'
GetUserProfileByUserIdAsync'', G
(''G H
userId''H N
)''N O
;''O P
if(( 

((( 
profile(( 
==(( 
null(( 
)(( 
return)) 
NotFound)) 
()) 
$str)) 4
)))4 5
;))5 6
return++ 
Ok++ 
(++ 
profile++ 
)++ 
;++ 
},, 
[00 
HttpGet00 

(00
 
$str00 
)00 
]00  
[11 
AllowAnonymous11 
]11 
public22 
async22 
Task22 
<22 
IActionResult22 
>22  
GetPublicProfile22! 1
(221 2
string222 8
username229 A
)22A B
{33 
var44 
user44 
=44 
await44 
_userManager44 !
.44! "
Users44" '
.55 	
Include55	 
(55 
u55 
=>55 
u55 
.55 
Image55 
)55 
.66 	
FirstOrDefaultAsync66	 
(66 
u66 
=>66 !
u66" #
.66# $
UserName66$ ,
==66- /
username660 8
)668 9
;669 :
if88 
(88 
user88 
==88 
null88 
)88 
return99 
NotFound99 
(99 
)99 
;99 
var;; 
roles;; 
=;; 
await;; 
_userManager;; "
.;;" #
GetRolesAsync;;# 0
(;;0 1
user;;1 5
);;5 6
;;;6 7
var<< 
role<< 
=<< 
roles<< 
.<< 
FirstOrDefault<< #
(<<# $
)<<$ %
??<<& (
$str<<) /
;<</ 0
var>> 
dto>> 
=>> #
UserProfileMapperHelper>> %
.>>% &
MapToDto>>& .
(>>. /
user>>/ 3
,>>3 4
Request>>5 <
,>>< =
role>>> B
)>>B C
;>>C D
return@@ 

Ok@@ 
(@@ 
dto@@ 
)@@ 
;@@ 
}AA 
[II 
HttpGetII 
(II 
$strII 
)II 
]II 
[JJ 
	AuthorizeJJ 
]JJ 
publicKK 

asyncKK 
TaskKK 
<KK 
IActionResultKK #
>KK# $
GetMyProfileKK% 1
(KK1 2
)KK2 3
{LL 
varNN 
userIdNN 
=NN 
UserNN 
.NN 
FindFirstValueNN (
(NN( )

ClaimTypesNN) 3
.NN3 4
NameIdentifierNN4 B
)NNB C
;NNC D
ifQQ 

(QQ 
stringQQ 
.QQ 
IsNullOrEmptyQQ  
(QQ  !
userIdQQ! '
)QQ' (
)QQ( )
{RR 	
returnTT 
UnauthorizedTT 
(TT  
$strTT  <
)TT< =
;TT= >
}UU 	
varWW 
profileWW 
=WW 
awaitWW 
_userRepositoryWW +
.WW+ ,'
GetUserProfileByUserIdAsyncWW, G
(WWG H
userIdWWH N
)WWN O
;WWO P
ifZZ 

(ZZ 
profileZZ 
==ZZ 
nullZZ 
)ZZ 
{[[ 	
var]] 
user]] 
=]] 
await]] 
_userManager]] )
.]]) *
FindByIdAsync]]* 7
(]]7 8
userId]]8 >
)]]> ?
;]]? @
if`` 
(`` 
user`` 
!=`` 
null`` 
)`` 
{aa 
varcc 
existingProfilecc #
=cc$ %
awaitcc& +
_authContextcc, 8
.cc8 9
UsersProfilescc9 F
.dd 
FirstOrDefaultAsyncdd (
(dd( )
pdd) *
=>dd+ -
pdd. /
.dd/ 0
UserNamedd0 8
.dd8 9
ToLowerdd9 @
(dd@ A
)ddA B
==ddC E
userddF J
.ddJ K
UserNameddK S
.ddS T
ToLowerddT [
(dd[ \
)dd\ ]
)dd] ^
;dd^ _
ifff 
(ff 
existingProfileff #
!=ff$ &
nullff' +
)ff+ ,
{gg 
returnii 

BadRequestii %
(ii% &
$"ii& (
$strii( K
{iiK L
useriiL P
.iiP Q
UserNameiiQ Y
}iiY Z
$striiZ ~
"ii~ 
)	ii Ä
;
iiÄ Å
}jj 
varll 

newProfilell 
=ll  
newll! $
UserProfilell% 0
{mm 
FullNamenn 
=nn 
usernn #
.nn# $
UserNamenn$ ,
,nn, -
UserNameoo 
=oo 
useroo #
.oo# $
UserNameoo$ ,
,oo, -
Emailpp 
=pp 
userpp  
.pp  !
Emailpp! &
,pp& '
Bioqq 
=qq 
nullqq 
}rr 
;rr 
awaittt 
_userRepositorytt %
.tt% &"
CreateUserProfileAsynctt& <
(tt< =

newProfilett= G
)ttG H
;ttH I
profilexx 
=xx 
awaitxx 
_userRepositoryxx  /
.xx/ 0'
GetUserProfileByUserIdAsyncxx0 K
(xxK L
userIdxxL R
)xxR S
;xxS T
}zz 
}{{ 	
if}} 

(}} 
profile}} 
==}} 
null}} 
)}} 
{~~ 	
return
ÄÄ 
NotFound
ÄÄ 
(
ÄÄ 
$str
ÄÄ 4
)
ÄÄ4 5
;
ÄÄ5 6
}
ÅÅ 	
return
ÑÑ 
Ok
ÑÑ 
(
ÑÑ 
profile
ÑÑ 
)
ÑÑ 
;
ÑÑ 
}
ÖÖ 
[
ââ 
HttpPut
ââ 
(
ââ 
$str
ââ 
)
ââ 
]
ââ 
[ää 
	Authorize
ää 

]
ää
 
publicãã 
async
ãã 
Task
ãã 
<
ãã 
IActionResult
ãã 
>
ãã  
UpdateMyProfile
ãã! 0
(
ãã0 1
[
ãã1 2
FromForm
ãã2 :
]
ãã: ;)
UpdateUserProfileRequestDto
ãã< W
request
ããX _
)
ãã_ `
{åå 
var
çç 
userId
çç 
=
çç 
User
çç 
.
çç 
	FindFirst
çç 
(
çç  

ClaimTypes
çç  *
.
çç* +
NameIdentifier
çç+ 9
)
çç9 :
?
çç: ;
.
çç; <
Value
çç< A
;
ççA B
if
èè 
(
èè 
string
èè 
.
èè 
IsNullOrEmpty
èè 
(
èè 
userId
èè #
)
èè# $
)
èè$ %
return
êê 
Unauthorized
êê 
(
êê 
)
êê 
;
êê 
try
íí 
{
ìì 
var
îî 
updatedProfile
îî 
=
îî 
await
îî "
_userRepository
îî# 2
.
îî2 3$
UpdateUserProfileAsync
îî3 I
(
îîI J
userId
îîJ P
,
îîP Q
request
îîR Y
)
îîY Z
;
îîZ [
if
ññ 

(
ññ 
updatedProfile
ññ 
==
ññ 
null
ññ "
)
ññ" #
return
óó 
NotFound
óó 
(
óó 
)
óó 
;
óó 
return
ôô 
Ok
ôô 
(
ôô 
updatedProfile
ôô  
)
ôô  !
;
ôô! "
}
öö 
catch
õõ 	
(
õõ
 
ArgumentException
õõ 
ex
õõ 
)
õõ  
{
úú 
return
ùù 

BadRequest
ùù 
(
ùù 
ex
ùù 
.
ùù 
Message
ùù $
)
ùù$ %
;
ùù% &
}
ûû 
catch
üü 	
(
üü
 
	Exception
üü 
)
üü 
{
†† 
return
°° 

StatusCode
°° 
(
°° 
$num
°° 
,
°° 
$str
°° A
)
°°A B
;
°°B C
}
¢¢ 
}££ 
[
™™ 
HttpPut
™™ 

(
™™
 
$str
™™ 
)
™™ 
]
™™ 
[
´´ 
	Authorize
´´ 
]
´´ 
public≠≠ 
async
≠≠ 
Task
≠≠ 
<
≠≠ 
IActionResult
≠≠ 
>
≠≠  
UpdatePassword
≠≠! /
(
≠≠/ 0
[
≠≠0 1
FromBody
≠≠1 9
]
≠≠9 :&
UpdateUserCredentialsDto
≠≠; S
credentials
≠≠T _
)
≠≠_ `
{ÆÆ 
var
ØØ 
user
ØØ 
=
ØØ 
await
ØØ 
_userManager
ØØ !
.
ØØ! "
GetUserAsync
ØØ" .
(
ØØ. /
User
ØØ/ 3
)
ØØ3 4
;
ØØ4 5
if
∞∞ 
(
∞∞ 
user
∞∞ 
==
∞∞ 
null
∞∞ 
)
∞∞ 
return
±± 
Unauthorized
±± 
(
±± 
$str
±± 5
)
±±5 6
;
±±6 7
if
≥≥ 
(
≥≥ 
string
≥≥ 
.
≥≥  
IsNullOrWhiteSpace
≥≥ !
(
≥≥! "
credentials
≥≥" -
.
≥≥- .
CurrentPassword
≥≥. =
)
≥≥= >
||
≥≥? A
string
¥¥ 
.
¥¥  
IsNullOrWhiteSpace
¥¥ !
(
¥¥! "
credentials
¥¥" -
.
¥¥- .
NewPassword
¥¥. 9
)
¥¥9 :
)
¥¥: ;
{
µµ 
return
∂∂ 

BadRequest
∂∂ 
(
∂∂ 
$str
∂∂ J
)
∂∂J K
;
∂∂K L
}
∑∑ 
var
ππ 
result
ππ 
=
ππ 
await
ππ 
_userManager
ππ #
.
ππ# $!
ChangePasswordAsync
ππ$ 7
(
ππ7 8
user
ππ8 <
,
ππ< =
credentials
ππ> I
.
ππI J
CurrentPassword
ππJ Y
,
ππY Z
credentials
ππ[ f
.
ππf g
NewPassword
ππg r
)
ππr s
;
ππs t
if
∫∫ 
(
∫∫ 
!
∫∫ 	
result
∫∫	 
.
∫∫ 
	Succeeded
∫∫ 
)
∫∫ 
{
ªª 
var
ºº 
errors
ºº 
=
ºº 
string
ºº 
.
ºº 
Join
ºº  
(
ºº  !
$str
ºº! %
,
ºº% &
result
ºº' -
.
ºº- .
Errors
ºº. 4
.
ºº4 5
Select
ºº5 ;
(
ºº; <
e
ºº< =
=>
ºº> @
e
ººA B
.
ººB C
Description
ººC N
)
ººN O
)
ººO P
;
ººP Q
return
ΩΩ 

BadRequest
ΩΩ 
(
ΩΩ 
errors
ΩΩ  
)
ΩΩ  !
;
ΩΩ! "
}
ææ 
return
¿¿ 

	NoContent
¿¿ 
(
¿¿ 
)
¿¿ 
;
¿¿ 
}¡¡ 
[
≈≈ 

HttpDelete
≈≈ 
(
≈≈ 
$str
≈≈ 
)
≈≈ 
]
≈≈ 
[∆∆ 
	Authorize
∆∆ 

]
∆∆
 
public«« 
async
«« 
Task
«« 
<
«« 
IActionResult
«« 
>
««  
DeleteMyProfile
««! 0
(
««0 1
)
««1 2
{»» 
var
…… 
userId
…… 
=
…… 
User
…… 
.
…… 
FindFirstValue
…… $
(
……$ %

ClaimTypes
……% /
.
……/ 0
NameIdentifier
……0 >
)
……> ?
;
……? @
var
ÀÀ 
deleted
ÀÀ 
=
ÀÀ 
await
ÀÀ 
_userRepository
ÀÀ '
.
ÀÀ' ($
DeleteUserProfileAsync
ÀÀ( >
(
ÀÀ> ?
userId
ÀÀ? E
)
ÀÀE F
;
ÀÀF G
if
ÕÕ 
(
ÕÕ 
!
ÕÕ 	
deleted
ÕÕ	 
)
ÕÕ 
{
ŒŒ 
return
œœ 
NotFound
œœ 
(
œœ 
$str
œœ C
)
œœC D
;
œœD E
}
–– 
return
““ 

	NoContent
““ 
(
““ 
)
““ 
;
““ 
}”” 
[
ŸŸ 
HttpGet
ŸŸ 
(
ŸŸ 
$str
ŸŸ 
)
ŸŸ 
]
ŸŸ 
public
⁄⁄ 

async
⁄⁄ 
Task
⁄⁄ 
<
⁄⁄ 
IActionResult
⁄⁄ #
>
⁄⁄# $
GetAllWriters
⁄⁄% 2
(
⁄⁄2 3
)
⁄⁄3 4
{
€€ 
var
‹‹ 
writers
‹‹ 
=
‹‹ 
await
‹‹ 
_userManager
‹‹ (
.
‹‹( )!
GetUsersInRoleAsync
‹‹) <
(
‹‹< =
$str
‹‹= E
)
‹‹E F
;
‹‹F G
var
›› 
	writerIds
›› 
=
›› 
writers
›› 
.
››  
Select
››  &
(
››& '
w
››' (
=>
››) +
w
››, -
.
››- .
Id
››. 0
)
››0 1
.
››1 2
ToList
››2 8
(
››8 9
)
››9 :
;
››: ;
var
ﬂﬂ 
writerProfiles
ﬂﬂ 
=
ﬂﬂ 
await
ﬂﬂ "
_authContext
ﬂﬂ# /
.
ﬂﬂ/ 0
UsersProfiles
ﬂﬂ0 =
.
‡‡ 
Include
‡‡ 
(
‡‡ 
p
‡‡ 
=>
‡‡ 
p
‡‡ 
.
‡‡ 
Image
‡‡ !
)
‡‡! "
.
·· 
Where
·· 
(
·· 
p
·· 
=>
·· 
	writerIds
·· !
.
··! "
Contains
··" *
(
··* +
p
··+ ,
.
··, -
Id
··- /
)
··/ 0
)
··0 1
.
‚‚ 
Select
‚‚ 
(
‚‚ 
p
‚‚ 
=>
‚‚ 
new
‚‚ 
UserProfileDto
‚‚ +
{
„„ 
Id
‰‰ 
=
‰‰ 
p
‰‰ 
.
‰‰ 
Id
‰‰ 
,
‰‰ 
UserName
ÂÂ 
=
ÂÂ 
p
ÂÂ 
.
ÂÂ 
UserName
ÂÂ %
,
ÂÂ% &
Email
ÊÊ 
=
ÊÊ 
p
ÊÊ 
.
ÊÊ 
Email
ÊÊ 
,
ÊÊ  
FullName
ÁÁ 
=
ÁÁ 
p
ÁÁ 
.
ÁÁ 
FullName
ÁÁ %
,
ÁÁ% &
Bio
ËË 
=
ËË 
p
ËË 
.
ËË 
Bio
ËË 
,
ËË 
ImageUrl
ÈÈ 
=
ÈÈ 
p
ÈÈ 
.
ÈÈ 
Image
ÈÈ "
!=
ÈÈ# %
null
ÈÈ& *
?
ÈÈ+ ,
p
ÈÈ- .
.
ÈÈ. /
Image
ÈÈ/ 4
.
ÈÈ4 5
Url
ÈÈ5 8
:
ÈÈ9 :
null
ÈÈ; ?
}
ÍÍ 
)
ÍÍ 
.
ÎÎ 
ToListAsync
ÎÎ 
(
ÎÎ 
)
ÎÎ 
;
ÎÎ 
return
ÌÌ 
Ok
ÌÌ 
(
ÌÌ 
writerProfiles
ÌÌ  
)
ÌÌ  !
;
ÌÌ! "
}
ÓÓ 
}ÔÔ ÎS
eC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Controllers\UserManagmentController.cs
[ 
Route 
( 
$str	 
) 
] 
[ 
ApiController 
] 
[ 
	Authorize 

( 
Roles 
= 
$str 
) 
] 
public 
class $
UserManagementController %
:& '
ControllerBase( 6
{ 
private 	
readonly
 $
IUserManagmentRepository +%
_userManagementRepository, E
;E F
private 	
readonly
 
IMapper 
_mapper "
;" #
private 	
readonly
 
AuthContext 
_context '
;' (
private 	
readonly
 
UserManager 
< 
UserProfile *
>* +
_userManager, 8
;8 9
public $
UserManagementController	 !
(" #$
IUserManagmentRepository $
userManagementRepository 7
,7 8
IMapper 
mapper 
, 
AuthContext 
context 
, 
UserManager 
< 
UserProfile 
> 
userManager *
)+ ,
{ %
_userManagementRepository 
= $
userManagementRepository  8
;8 9
_mapper 
= 
mapper 
; 
_context 
= 
context 
; 
_userManager 
= 
userManager 
; 
} 
[!! 
HttpPost!! 
(!! 
$str!! 
)!! 
]!! 
public"" 
async""	 
Task"" 
<"" 
IActionResult"" !
>""! "

CreateUser""# -
("". /
[""0 1
FromBody""1 9
]""9 : 
CreateUserRequestDto""; O
request""P W
)""X Y
{## 
try$$ 
{%% 
request&& 
.&& 
UserName&& 
=&& 
request&&  
.&&  !
UserName&&! )
.&&) *
Replace&&* 1
(&&2 3
$str&&4 7
,&&7 8
$str&&9 ;
)&&< =
;&&= >
var)) 	
existingProfile))
 
=)) 
await)) !
_context))" *
.))* +
UsersProfiles))+ 8
.** 
FirstOrDefaultAsync**  
(**  !
p**! "
=>**# %
p**& '
.**' (
UserName**( 0
.**0 1
ToLower**1 8
(**8 9
)**9 :
==**; =
request**> E
.**E F
UserName**F N
.**N O
ToLower**O V
(**V W
)**W X
)**X Y
;**Y Z
if,, 
(,,	 

existingProfile,, 
!=,, 
null,, "
),,# $
{-- 
return.. 

BadRequest.. 
(.. 
$".. 
$str.. (
{..( )
request..) 0
...0 1
UserName..1 9
}..9 :
$str..: K
"..K L
)..M N
;..N O
}// 
if22 
(22	 

request22 
.22 
Role22 
!=22 
$str22 #
&&22$ &
request22' .
.22. /
Role22/ 3
!=224 6
$str227 =
)22> ?
{33 
return44 

BadRequest44 
(44 
$str44 F
)44G H
;44H I
}55 
var77 	
userProfile77
 
=77 
new77 
UserProfile77 '
{88 
FullName99 
=99 
request99 
.99 
FullName99 #
,99# $
UserName:: 
=:: 
request:: 
.:: 
UserName:: #
,::# $
Email;; 
=;; 
request;; 
.;; 
Email;; 
,;; 
Bio<< 
=<< 
request<< 
.<< 
Bio<< 
,<< 
	Interests== 
=== 
request== 
.== 
	Interests== %
}>> 
;>> 
var@@ 	
createdProfile@@
 
=@@ 
await@@  %
_userManagementRepository@@! :
.@@: ;
CreateUserAsync@@; J
(@@J K
userProfileAA 
,AA 
requestBB 
.BB 
PasswordBB 
,BB 
requestCC 
.CC 
EmailCC 
,CC 
requestDD 
.DD 
RoleDD 
)EE 	
;EE	 

returnGG 
OkGG 
(GG 
_mapperGG 
.GG 
MapGG 
<GG 
UserProfileDtoGG ,
>GG, -
(GG. /
createdProfileGG0 >
)GG? @
)GGA B
;GGB C
}HH 
catchII 	
(II
  
ApplicationExceptionII  
exII! #
)II$ %
{JJ 
returnKK 

BadRequestKK 
(KK 
exKK 
.KK 
MessageKK $
)KK% &
;KK& '
}LL 
catchMM 	
(MM
 
	ExceptionMM 
exMM 
)MM 
{NN 
returnOO 

StatusCodeOO 
(OO 
$numOO 
,OO 
$strOO /
+OO0 1
exOO2 4
.OO4 5
MessageOO5 <
)OO= >
;OO> ?
}PP 
}QQ 
[UU 
HttpGetUU 

(UU 
$strUU 
)UU 
]UU 
publicVV 
asyncVV	 
TaskVV 
<VV 
IActionResultVV !
>VV! "
GetAllUsersVV# .
(VV/ 0
)VV1 2
{WW 
varXX 
writersXX 
=XX 
awaitXX %
_userManagementRepositoryXX 1
.XX1 2
GetAllUsersAsyncXX2 B
(XXB C
)XXC D
;XXD E
returnYY 

OkYY 
(YY 
_mapperYY 
.YY 
MapYY 
<YY 
ListYY  
<YY  !
UserProfileDtoYY! /
>YY/ 0
>YY0 1
(YY2 3
writersYY4 ;
)YY< =
)YY> ?
;YY? @
}ZZ 
[^^ 
HttpGet^^ 

(^^ 
$str^^ 
)^^  !
]^^! "
public__ 
async__	 
Task__ 
<__ 
IActionResult__ !
>__! "
	GetWriter__# ,
(__- .
string__/ 5
userId__6 <
)__= >
{`` 
varaa 
writeraa 
=aa 
awaitaa %
_userManagementRepositoryaa 0
.aa0 1
GetWriterByIdAsyncaa1 C
(aaC D
userIdaaD J
)aaJ K
;aaK L
ifbb 
(bb 
writerbb	 
==bb 
nullbb 
)bb 
returncc 
NotFoundcc 
(cc 
$strcc /
)cc0 1
;cc1 2
returnee 

Okee 
(ee 
_mapperee 
.ee 
Mapee 
<ee 
UserProfileDtoee *
>ee* +
(ee, -
writeree. 4
)ee5 6
)ee7 8
;ee8 9
}ff 
[ii 
HttpPutii 

(ii 
$strii $
)ii% &
]ii& '
publicjj 
asyncjj	 
Taskjj 
<jj 
IActionResultjj !
>jj! "
UpdateUserRolejj# 1
(jj2 3
stringjj4 :
userIdjj; A
,jjA B
[jjC D
FromBodyjjD L
]jjL M$
UpdateUserRoleRequestDtojjN f
requestjjg n
)jjo p
{kk 
tryll 
{mm 
varnn 	
updatedProfilenn
 
=nn 
awaitnn  %
_userManagementRepositorynn! :
.nn: ;
UpdateUserRoleAsyncnn; N
(nnN O
userIdnnO U
,nnU V
requestnnW ^
.nn^ _
NewRolenn_ f
)nnf g
;nng h
ifoo 
(oo	 

updatedProfileoo 
==oo 
nulloo !
)oo" #
returnpp 
NotFoundpp 
(pp 
$strpp 2
)pp3 4
;pp4 5
returnrr 
Okrr 
(rr 
_mapperrr 
.rr 
Maprr 
<rr 
UserProfileDtorr ,
>rr, -
(rr. /
updatedProfilerr0 >
)rr? @
)rrA B
;rrB C
}ss 
catchtt 	
(tt
  
ApplicationExceptiontt  
extt! #
)tt$ %
{uu 
returnvv 

BadRequestvv 
(vv 
exvv 
.vv 
Messagevv $
)vv% &
;vv& '
}ww 
}xx 
[{{ 

HttpDelete{{ 
({{ 
$str{{  
){{! "
]{{" #
[|| 
	Authorize|| 
]|| 
public}} 
async}}	 
Task}} 
<}} 
IActionResult}} !
>}}! "

RemoveUser}}# -
(}}. /
string}}0 6
userId}}7 =
)}}> ?
{~~ 
try 
{
ÄÄ 
var
ÅÅ 	
removedUser
ÅÅ
 
=
ÅÅ 
await
ÅÅ '
_userManagementRepository
ÅÅ 7
.
ÅÅ7 8
RemoveUserAsync
ÅÅ8 G
(
ÅÅG H
userId
ÅÅH N
,
ÅÅN O
User
ÅÅP T
)
ÅÅT U
;
ÅÅU V
if
ÇÇ 
(
ÇÇ	 

removedUser
ÇÇ 
==
ÇÇ 
null
ÇÇ 
)
ÇÇ  
return
ÉÉ 
NotFound
ÉÉ 
(
ÉÉ 
$str
ÉÉ 2
)
ÉÉ3 4
;
ÉÉ4 5
return
ÖÖ 
	NoContent
ÖÖ 
(
ÖÖ 
)
ÖÖ 
;
ÖÖ 
}
ÜÜ 
catch
áá 	
(
áá
 )
UnauthorizedAccessException
áá '
)
áá( )
{
àà 
return
ââ 
Forbid
ââ 
(
ââ 
$str
ââ H
)
ââI J
;
ââJ K
}
ää 
catch
ãã 	
(
ãã
 
	Exception
ãã 
ex
ãã 
)
ãã 
{
åå 
return
çç 

StatusCode
çç 
(
çç 
$num
çç 
,
çç 
ex
çç !
.
çç! "
Message
çç" )
)
çç* +
;
çç+ ,
}
éé 
}
èè 
}íí À
hC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Controllers\UserImageProfileController.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Controllers #
{ 
[		 
Route		 
(			 

$str		 
)		 
]		  
[

 
ApiController

 
]

 
public 
class	 &
UserImageProfileController )
:* +
ControllerBase, :
{ 
private 
readonly '
IUserImageProfileRepository 0#
_imageProfileRepository1 H
;H I
private 
readonly 
IMapper 
_mapper $
;$ %
public 
&
UserImageProfileController %
(& ''
IUserImageProfileRepository( C"
imageProfileRepositoryD Z
,Z [
IMapper 
mapper 
) 
{ #
_imageProfileRepository 
= "
imageProfileRepository  6
;6 7
_mapper 
= 
mapper 
; 
} 
[ 
HttpPost 
( 
$str 
)  
]  !
[ 
	Authorize 
( 
Roles 
= 
$str !
)" #
]# $
public 

async 
Task 
< 
ActionResult "
<" #
UserImageProfileDto# 6
>6 7
>7 8
UploadImage9 D
(E F
	IFormFileG P
fileQ U
)V W
{ 
try 	
{ 
var 
	saveImage 
= 
await #
_imageProfileRepository 5
.5 6
SaveUserImageAsync6 H
(H I
fileI M
)M N
;N O
var 
imageDto 
= 
_mapper 
.  
Map  #
<# $
UserImageProfileDto$ 7
>7 8
(8 9
	saveImage9 B
)B C
;C D
imageDto 
. 
Url 
= 
$" 
{ 
Request !
.! "
Scheme" (
}( )
$str) ,
{, -
Request- 4
.4 5
Host5 9
}9 :
$str: ;
{; <
	saveImage< E
.E F
UrlF I
}I J
"J K
;K L
return   
Ok   
(   
imageDto   
)   
;   
}!! 
catch"" 
("" 
ArgumentException"" 
e""  !
)""" #
{## 
return$$ 

BadRequest$$ 
($$ 
e$$ 
.$$ 
Message$$ %
)$$& '
;$$' (
}&& 
catch'' 
('' 
	Exception'' 
e'' 
)'' 
{(( 
return)) 

StatusCode)) 
()) 
$num)) 
,))  
$"))! #
$str))# ?
{))? @
e))@ A
.))A B
Message))B I
}))I J
"))J K
)))L M
;))M N
}** 
}++ 
},, 
}-- ≈
^C:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Controllers\ImagesController.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Controllers #
{		 
[

 
Route

 
(

	 

$str

 
)

 
]

  
[ 
ApiController 
] 
public 
class	 
ImagesController 
:  !
ControllerBase" 0
{ 
private 
readonly 
IImageRepository %
_imageRepository& 6
;6 7
private 
readonly 
IMapper 
_mapper $
;$ %
public 

ImagesController 
( 
IImageRepository -
imageRepository. =
,= >
IMapper? F
mapperG M
)N O
{P Q
_imageRepository 
= 
imageRepository (
;( )
_mapper 
= 
mapper 
; 
} 
[ 
HttpPost 
] 
public 

async 
Task 
< 
ActionResult "
<" #
BlogImageDto# /
>/ 0
>0 1
UploadImages2 >
(? @
	IFormFileA J
fileK O
,O P
[Q R
FromFormR Z
]Z [
string\ b
fileNamec k
)k l
{m n
try 
{ 
var 

savedImage 
= 
await 
_imageRepository /
./ 0
SaveImageAsync0 >
(> ?
file? C
,C D
fileNameE M
)M N
;N O
var 
imageDto 
= 
_mapper 
. 
Map "
<" #
BlogImageDto# /
>/ 0
(0 1

savedImage1 ;
); <
;< =
imageDto 
. 
Url 
= 
$" 
{ 
Request !
.! "
Scheme" (
}( )
$str) ,
{, -
Request- 4
.4 5
Host5 9
}9 :
$str: ;
{; <

savedImage< F
.F G
UrlG J
}J K
"K L
;L M
return 
Ok 
( 
imageDto 
) 
; 
} 	
catch 
( 
ArgumentException  
e! "
)" #
{# $
return   

BadRequest   
(   
e   
.   
Message   %
)  & '
;  ' (
}"" 	
catch## 
(## 
	Exception## 
e## 
)## 
{## 
return$$ 

StatusCode$$ 
($$ 
$num$$ 
,$$  
$"$$! #
$str$$# ?
{$$? @
e$$@ A
.$$A B
Message$$B I
}$$I J
"$$J K
)$$L M
;$$M N
}%% 	
}'' 
}(( 
})) ã-
aC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Controllers\FavoritesController.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Controllers #
{ 
[ 
Route 
(	 

$str 
) 
]  
[		 
ApiController		 
]		 
[

 
	Authorize

 
]

 
public 
class	 
FavoritesController "
:# $
ControllerBase% 3
{ 
private 
readonly 
IFavoriteRepository (
_favoriteRepository) <
;< =
public 

FavoritesController 
(  
IFavoriteRepository! 4
favoriteRepository5 G
)H I
{ 
_favoriteRepository 
= 
favoriteRepository .
;. /
} 
[ 
HttpPost 
( 
$str 
)  !
]! "
public 

async 
Task 
< 
IActionResult #
># $
AddToFavorites% 3
(4 5
Guid6 :
postId; A
)B C
{ 
var 	
userId
 
= 
User 
. 
FindFirstValue &
(& '

ClaimTypes( 2
.2 3
NameIdentifier3 A
)A B
;B C
var 	
result
 
= 
await 
_favoriteRepository ,
., -
AddToFavoritesAsync- @
(A B
userIdC I
,I J
postIdK Q
)R S
;S T
if 
(	 

result 
== 
null 
) 
{ 
return 

BadRequest 
( 
$str 7
)8 9
;9 :
} 
return 
Ok 
( 
result 
) 
; 
} 
[## 
HttpGet## 
]## 
public$$ 

async$$ 
Task$$ 
<$$ 
IActionResult$$ #
>$$# $
GetMyFavorites$$% 3
($$4 5
)$$6 7
{%% 
var&& 	
userId&&
 
=&& 
User&& 
.&& 
FindFirstValue&& &
(&&& '

ClaimTypes&&( 2
.&&2 3
NameIdentifier&&3 A
)&&A B
;&&B C
var'' 	
posts''
 
='' 
await'' 
_favoriteRepository'' +
.''+ ,"
GetFavoriteByUserAsync'', B
(''C D
userId''E K
)''L M
;''M N
return(( 
Ok(( 
((( 
posts(( 
)(( 
;(( 
})) 
[++ 
HttpGet++ 
(++ 
$str++ 
)++  
]++  !
[,, 
AllowAnonymous,, 
],, 
public-- 

async-- 
Task-- 
<-- 
IActionResult-- #
>--# $ 
GetFavoritesByUserId--% 9
(--: ;
[--< =
	FromRoute--= F
]--F G
string--H N
userId--O U
)--V W
{.. 
var// 	
	favorites//
 
=// 
await// 
_favoriteRepository// /
./// 0"
GetFavoriteByUserAsync//0 F
(//F G
userId//G M
)//M N
;//N O
return00 
Ok00 
(00 
	favorites00 
)00 
;00 
}11 
[44 
HttpGet44 
(44 
$str44 )
)44* +
]44+ ,
public55 

async55 
Task55 
<55 
IActionResult55 #
>55# $!
IsPostFavoritedByUser55% :
(55; <
Guid55= A
postId55B H
)55I J
{66 
var77 	
userId77
 
=77 
User77 
.77 
FindFirstValue77 &
(77& '

ClaimTypes77( 2
.772 3
NameIdentifier773 A
)77A B
;77B C
var88 	

isFavorite88
 
=88 
await88 
_favoriteRepository88 0
.880 1&
IsPostFavoritedByUserAsync881 K
(88L M
userId88N T
,88T U
postId88V \
)88] ^
;88^ _
return99 
Ok99 
(99 

isFavorite99 
)99 
;99 
}:: 
[== 

HttpDelete== 
(== 
$str== !
)==" #
]==# $
public>> 

async>> 
Task>> 
<>> 
IActionResult>> #
>>># $
RemoveFromFavorites>>% 8
(>>9 :
Guid>>; ?
postId>>@ F
)>>G H
{?? 
var@@ 	
userId@@
 
=@@ 
User@@ 
.@@ 
FindFirstValue@@ &
(@@& '

ClaimTypes@@( 2
.@@2 3
NameIdentifier@@3 A
)@@A B
;@@B C
varAA 	
resultAA
 
=AA 
awaitAA 
_favoriteRepositoryAA ,
.AA, -$
RemoveFromFavoritesAsyncAA- E
(AAF G
userIdAAH N
,AAN O
postIdAAP V
)AAW X
;AAX Y
ifCC 
(CC	 

!CC 
resultCC 
)CC 
returnDD 

BadRequestDD 
(DD 
$strDD =
)DD> ?
;DD? @
returnFF 
	NoContentFF 
(FF 
)FF 
;FF 
}GG 
}LL 
}MM ÈA
bC:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Controllers\CategoriesController.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Controllers #
{ 
[ 
Route 
( 	
$str	 
) 
] 
[ 
ApiController 
] 
public 
class	  
CategoriesController #
:$ %
ControllerBase& 4
{ 
private 
readonly 
ICategoryRepository (
_categoryRepository) <
;< =
private 
readonly 
IMapper 
_mapper $
;$ %
public 
 
CategoriesController 
(  
ICategoryRepository  3
categoryRepository4 F
,F G
IMapperH O
mapperP V
)V W
{ 
_categoryRepository 
= 
categoryRepository .
;. /
_mapper 
= 
mapper 
; 
} 
[ 
HttpPost 
] 
[ 
	Authorize 
( 
Roles 
= 
$str 
)  
]  !
public 

async 
Task 
< 
IActionResult #
># $
createCategory% 3
(3 4
CreateCategoriesDto4 G
requestH O
)O P
{ 
var   	
category  
 
=   
_mapper   
.   
Map    
<    !
Category  ! )
>  ) *
(  * +
request  + 2
)  2 3
;  3 4
await"" 
_categoryRepository"" 
.""  
CreateAsync""  +
(""+ ,
category"", 4
)""4 5
;""5 6
return## 
Ok## 
(## 
_mapper## 
.## 
Map## 
<## 
CategoryDto## '
>##' (
(##( )
category##) 1
)##1 2
)##2 3
;##3 4
}'' 
[)) 
HttpGet)) 
])) 
public++ 

async++ 
Task++ 
<++ 
IActionResult++ #
>++# $
GetCategories++% 2
(++3 4
[++5 6
	FromQuery++6 ?
]++? @
string++A G
?++G H
query++I N
,++N O
[,, 
	FromQuery,, 
],, 
string,, 
?,, 
sortBy,,  
,,,! "
[-- 
	FromQuery-- 
]-- 
string-- 
?-- 
sortDirection-- '
,--' (
[.. 
	FromQuery.. 
].. 
int.. 
?.. 

pageNumber.. !
,..! "
[// 
	FromQuery// 
]// 
int// 
?// 
pageSize// 
)//  
{00 
var11 	

categories11
 
=11 
await11 
_categoryRepository11 0
.110 1
GetAllCategories111 A
(11A B
query11B G
,11G H
sortBy11I O
,11O P
sortDirection11Q ^
,11^ _

pageNumber11` j
,11j k
pageSize11l t
)11t u
;11u v
return22 
Ok22 
(22 
_mapper22 
.22 
Map22 
<22 
IEnumerable22 '
<22' (
CategoryDto22( 3
>223 4
>224 5
(225 6

categories226 @
)22@ A
)22A B
;22B C
}44 
[66 
HttpGet66 
]66 
[77 
Route77 

(77
 
$str77 
)77 
]77 
public88 

async88 
Task88 
<88 
IActionResult88 #
>88# $
GetCategoryById88% 4
(884 5
[885 6
	FromRoute886 ?
]88? @
Guid88A E
id88F H
)88H I
{99 
var;; 	

categoryId;;
 
=;; 
await;; 
_categoryRepository;; 0
.;;0 1 
GetCategoryByIdAsync;;1 E
(;;E F
id;;F H
);;H I
;;;I J
if<< 
(<<	 


categoryId<<
 
==<< 
null<< 
)<< 
{== 
return>> 
NotFound>> 
(>> 
)>> 
;>> 
}?? 
returnBB 
OkBB 
(BB 
_mapperBB 
.BB 
MapBB 
<BB 
CategoryDtoBB '
>BB' (
(BB( )

categoryIdBB) 3
)BB3 4
)BB4 5
;BB5 6
}DD 
[FF 
HttpGetFF 
]FF 
[GG 
RouteGG 

(GG
 
$strGG 
)GG 
]GG 
publicHH 

asyncHH 
TaskHH 
<HH 
IActionResultHH #
>HH# $
GetCategoriesCountHH% 7
(HH8 9
)HH: ;
{II 
varJJ 	
resultJJ
 
=JJ 
awaitJJ 
_categoryRepositoryJJ ,
.JJ, -#
GetCategoriesCountAsyncJJ- D
(JJD E
)JJE F
;JJF G
returnKK 
OkKK 
(KK 
resultKK 
)KK 
;KK 
}LL 
[NN 
HttpPutNN 
]NN 
[OO 
RouteOO 

(OO
 
$strOO 
)OO 
]OO 
[PP 
	AuthorizePP 
(PP 
RolesPP 
=PP 
$strPP 
)PP  
]PP  !
publicQQ 

asyncQQ 
TaskQQ 
<QQ 
IActionResultQQ #
>QQ# $
EditCategoryQQ% 1
(QQ1 2
[QQ2 3
	FromRouteQQ3 <
]QQ< =
GuidQQ> B
idQQC E
,QQE F$
UpdateCategoryRequestDtoQQG _

requestDtoQQ` j
)QQj k
{RR 
varTT 	
categoryTT
 
=TT 
_mapperTT 
.TT 
MapTT  
<TT  !
CategoryTT! )
>TT) *
(TT* +

requestDtoTT+ 5
)TT5 6
;TT6 7
categoryUU 
.UU 
IdUU 
=UU 
idUU 
;UU 
categoryVV 
=VV 
awaitVV 
_categoryRepositoryVV *
.VV* +
UpdateCategoryAsyncVV+ >
(VV> ?
categoryVV? G
)VVG H
;VVH I
ifXX 
(XX 	
categoryXX	 
==XX 
nullXX 
)XX 
{YY 
returnZZ 
NotFoundZZ 
(ZZ 
)ZZ 
;ZZ 
}[[ 
return\\ 
Ok\\ 
(\\ 
_mapper\\ 
.\\ 
Map\\ 
<\\ 
CategoryDto\\ '
>\\' (
(\\( )
category\\) 1
)\\1 2
)\\2 3
;\\3 4
}__ 
[aa 

HttpDeleteaa 
]aa 
[bb 
Routebb 

(bb
 
$strbb 
)bb 
]bb 
[cc 
	Authorizecc 
(cc 
Rolescc 
=cc 
$strcc 
)cc  
]cc  !
publicdd 

asyncdd 
Taskdd 
<dd 
IActionResultdd #
>dd# $
DeleteCategorydd% 3
(dd3 4
[dd4 5
	FromRoutedd5 >
]dd> ?
Guiddd@ D
idddE G
)ddG H
{ee 
varff 	
categoryff
 
=ff 
awaitff 
_categoryRepositoryff .
.ff. /
DeleteCategoryAsyncff/ B
(ffB C
idffC E
)ffE F
;ffF G
ifgg 
(gg 	
categorygg	 
==gg 
nullgg 
)gg 
{hh 
returnii 
NotFoundii 
(ii 
)ii 
;ii 
}jj 
returnll 
Okll 
(ll 
_mapperll 
.ll 
Mapll 
<ll 
CategoryDtoll '
>ll' (
(ll( )
categoryll) 1
)ll1 2
)ll2 3
;ll3 4
}mm 
}nn 
}oo ä≈
`C:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Controllers\BlogPostController.cs
	namespace

 	
	CodePulse


 
.

 
API

 
.

 
Controllers

 #
{ 
[ 
Route 
(	 

$str 
) 
]  
[ 
ApiController 
] 
public 
class	 
BlogPostController !
:" #
ControllerBase$ 2
{ 
private 
readonly 
IBlogPostRepository (
_postRepository) 8
;8 9
private 
readonly 
ICategoryRepository (
_categoryRepository) <
;< =
private 
readonly 
UserManager  
<  !
UserProfile! ,
>, -
_userManager. :
;: ;
private 
readonly 
ILogger 
< 
BlogPostController /
>/ 0
_logger1 8
;8 9
public 

BlogPostController 
( 
IBlogPostRepository 
postRepository *
,* +
ICategoryRepository 
categoryRepository .
,. /
UserManager 
< 
UserProfile 
>  
userManager! ,
,, -
ILogger 
< 
BlogPostController "
>" #
logger$ *
)+ ,
{ 
_postRepository 
= 
postRepository &
;& '
_categoryRepository 
= 
categoryRepository .
;. /
_userManager 
= 
userManager  
;  !
_logger 
= 
logger 
; 
} 
[!! 
HttpPost!! 
]!! 
["" 
	Authorize"" 
("" 
Roles"" 
="" 
$str"" '
)""( )
]"") *
public## 

async## 
Task## 
<## 
IActionResult## #
>### $
CreateBlogPost##% 3
(##4 5
[##6 7
FromBody##7 ?
]##? @$
CreateBlogPostRequestDto##A Y
createBlogPost##Z h
)##i j
{$$ 
if%% 
(%%	 

createBlogPost%% 
==%% 
null%% !
)%%" #
{&& 
return'' 

BadRequest'' 
('' 
$str'' 3
)''4 5
;''5 6
}(( 
createBlogPost)) 
.)) 
	UrlHandle)) 
=))  
FormatUrlHandle))! 0
())1 2
createBlogPost))3 A
.))A B
	UrlHandle))B K
)))L M
;))M N
var++ 	
userId++
 
=++ 
User++ 
.++ 
FindFirstValue++ &
(++& '

ClaimTypes++' 1
.++1 2
NameIdentifier++2 @
)++@ A
;++A B
var,, 	
user,,
 
=,, 
await,, 
_userManager,, #
.,,# $
FindByIdAsync,,$ 1
(,,1 2
userId,,2 8
),,8 9
;,,9 :
if-- 
(--	 

user-- 
==-- 
null-- 
)-- 
{.. 
return// 
NotFound// 
(// 
$str// +
)//, -
;//- .
}00 
var22 	
blogPost22
 
=22 
await22  
BlogPostMapperHelper22 /
.22/ 0
MapToDomainAsync220 @
(22@ A
createBlogPost22A O
,22O P
user22Q U
.22U V
Id22V X
,22X Y
_categoryRepository22Z m
)22m n
;22n o
blogPost44 
=44 
await44 
_postRepository44 &
.44& '
CreateBlogPostAsync44' :
(44; <
blogPost44= E
)44F G
;44G H
var55 	
response55
 
=55  
BlogPostMapperHelper55 )
.55) *
MapToDto55* 2
(552 3
blogPost553 ;
)55; <
;55< =
return66 
Ok66 
(66 
response66 
)66 
;66 
}77 
[;; 
HttpGet;; 
];; 
public<< 

async<< 
Task<< 
<<< 
IActionResult<< #
><<# $
GetAllBlogPosts<<% 4
(<<5 6
[== 	
	FromQuery==	 
]== 
string== 
?== 
query== !
,==! "
[>> 	
	FromQuery>>	 
]>> 
string>> 
?>> 
sortBy>> "
,>>" #
[?? 	
	FromQuery??	 
]?? 
string?? 
??? 
sortDirection?? )
,??) *
[@@ 	
	FromQuery@@	 
]@@ 
int@@ 
?@@ 

pageNumber@@ #
,@@# $
[AA 	
	FromQueryAA	 
]AA 
intAA 
?AA 
pageSizeAA !
)AA" #
{BB 
varCC 	
	blogPostsCC
 
=CC 
awaitCC 
_postRepositoryCC +
.CC+ ,
GetAllAsyncCC, 7
(CC7 8
queryCC8 =
,CC= >
sortByCC? E
,CCE F
sortDirectionCCG T
,CCT U

pageNumberCCV `
,CC` a
pageSizeCCb j
)CCj k
;CCk l
varEE 	
mappedEE
 
=EE 
	blogPostsEE 
.EE 
SelectEE #
(EE# $ 
BlogPostMapperHelperEE$ 8
.EE8 9
MapToDtoEE9 A
)EEA B
.EEB C
ToListEEC I
(EEI J
)EEJ K
;EEK L
returnFF 
OkFF 
(FF 
mappedFF 
)FF 
;FF 
}GG 
[KK 
HttpGetKK 
]KK 
[LL 
RouteLL 

(LL 
$strLL 
)LL 
]LL 
publicMM 

asyncMM 
TaskMM 
<MM 
IActionResultMM #
>MM# $
GetBlogPostByIdMM% 4
(MM5 6
[MM7 8
	FromRouteMM8 A
]MMA B
GuidMMC G
idMMH J
)MMK L
{NN 
varOO 	
blogPostOO
 
=OO 
awaitOO 
_postRepositoryOO *
.OO* + 
GetBlogPostByIdAsyncOO+ ?
(OO? @
idOO@ B
)OOB C
;OOC D
ifPP 
(PP	 

blogPostPP 
==PP 
nullPP 
)PP 
{QQ 
returnRR 
NotFoundRR 
(RR 
)RR 
;RR 
}SS 
returnTT 
OkTT 
(TT  
BlogPostMapperHelperTT &
.TT& '
MapToDtoTT' /
(TT0 1
blogPostTT2 :
)TT; <
)TT= >
;TT> ?
}UU 
[ZZ 
HttpGetZZ 
(ZZ 
$strZZ 
)ZZ 
]ZZ 
[\\ 
	Authorize\\ 
(\\ 
Roles\\ 
=\\ 
$str\\ (
)\\) *
]\\* +
public]] 

async]] 
Task]] 
<]] 
IActionResult]] #
>]]# $
GetAuthorPosts]]% 3
(]]4 5
)]]6 7
{^^ 
var__ 	
userId__
 
=__ 
User__ 
.__ 
FindFirstValue__ &
(__& '

ClaimTypes__' 1
.__1 2
NameIdentifier__2 @
)__@ A
;__A B
var`` 	
isAdmin``
 
=`` 
User`` 
.`` 
IsInRole`` !
(``! "
$str``" )
)``) *
;``* +
varbb 	
postsbb
 
=bb 
isAdminbb 
?bb 
awaitbb !
_postRepositorybb" 1
.bb1 2
GetAllAsyncbb2 =
(bb= >
)bb> ?
:bb@ A
awaitcc 
_postRepositorycc 
.cc  
GetPostByAuthorAsynccc 2
(cc2 3
userIdcc3 9
)cc9 :
;cc: ;
varee 	
mapedee
 
=ee 
postsee 
.ee 
Selectee 
(ee  
BlogPostMapperHelperee 3
.ee3 4
MapToDtoee4 <
)ee< =
.ee= >
ToListee> D
(eeD E
)eeE F
;eeF G
returnff 
Okff 
(ff 
mapedff 
)ff 
;ff 
}hh 
[kk 
HttpGetkk 
(kk 
$strkk "
)kk# $
]kk$ %
[ll 
AllowAnonymousll 
]ll 
publicmm 

asyncmm 
Taskmm 
<mm 
IActionResultmm #
>mm# $
GetPostsByAuthorIdmm% 7
(mm8 9
[mm: ;
	FromRoutemm; D
]mmD E
stringmmF L
authorIdmmM U
)mmV W
{nn 
varoo 	
postsoo
 
=oo 
awaitoo 
_postRepositoryoo '
.oo' ( 
GetPostByAuthorAsyncoo( <
(oo< =
authorIdoo= E
)ooE F
;ooF G
varpp 	
mappedPostspp
 
=pp 
postspp 
.pp 
Selectpp $
(pp$ % 
BlogPostMapperHelperpp% 9
.pp9 :
MapToDtopp: B
)ppB C
.ppC D
ToListppD J
(ppJ K
)ppK L
;ppL M
returnqq 
Okqq 
(qq 
mappedPostsqq 
)qq 
;qq  
}rr 
[uu 
HttpGetuu 
(uu 
$struu 
)uu 
]uu 
publicvv 

asyncvv 
Taskvv 
<vv 
IActionResultvv #
>vv# $
GetPostByUrlHandlevv% 7
(vv8 9
stringvv: @
	urlHandlevvA J
)vvK L
{ww 
varxx 	
postxx
 
=xx 
awaitxx 
_postRepositoryxx &
.xx& '"
GetBlogPostByUrlHandlexx' =
(xx= >
	urlHandlexx> G
)xxG H
;xxH I
ifyy 
(yy	 

postyy 
==yy 
nullyy 
)yy 
returnyy  
NotFoundyy! )
(yy* +
)yy, -
;yy- .
postzz 

.zz
 
	ViewCountzz 
++zz 
;zz 
await{{ 
_postRepository{{ 
.{{ 
UpdateBlogPostAsync{{ /
({{0 1
post{{2 6
){{7 8
;{{8 9
var|| 	
dto||
 
=||  
BlogPostMapperHelper|| $
.||$ %
MapToDto||% -
(||- .
post||. 2
)||2 3
;||3 4
return}} 
Ok}} 
(}} 
dto}} 
)}} 
;}} 
}~~ 
[
ÅÅ 
HttpPut
ÅÅ 
]
ÅÅ 
[
ÇÇ 
Route
ÇÇ 

(
ÇÇ 
$str
ÇÇ 
)
ÇÇ 
]
ÇÇ 
[
ÉÉ 
	Authorize
ÉÉ 
(
ÉÉ 
Roles
ÉÉ 
=
ÉÉ 
$str
ÉÉ '
)
ÉÉ( )
]
ÉÉ) *
public
ÑÑ 

async
ÑÑ 
Task
ÑÑ 
<
ÑÑ 
IActionResult
ÑÑ #
>
ÑÑ# $
UpdateBlogPost
ÑÑ% 3
(
ÑÑ4 5
[
ÑÑ6 7
	FromRoute
ÑÑ7 @
]
ÑÑ@ A
Guid
ÑÑB F
id
ÑÑG I
,
ÑÑI J
[
ÑÑK L
FromBody
ÑÑL T
]
ÑÑT U&
UpdateBlogPostRequestDto
ÑÑV n
updateBlogPost
ÑÑo }
)
ÑÑ~ 
{
ÖÖ 
var
ÜÜ 	
existingBlogPost
ÜÜ
 
=
ÜÜ 
await
ÜÜ "
_postRepository
ÜÜ# 2
.
ÜÜ2 3"
GetBlogPostByIdAsync
ÜÜ3 G
(
ÜÜG H
id
ÜÜH J
)
ÜÜJ K
;
ÜÜK L
if
áá 
(
áá	 

existingBlogPost
áá 
==
áá 
null
áá #
)
áá$ %
{
àà 
return
ââ 
NotFound
ââ 
(
ââ 
)
ââ 
;
ââ 
}
ää 
var
åå 	
userId
åå
 
=
åå 
User
åå 
.
åå 
FindFirstValue
åå &
(
åå& '

ClaimTypes
åå' 1
.
åå1 2
NameIdentifier
åå2 @
)
åå@ A
;
ååA B
if
çç 
(
çç	 

existingBlogPost
çç 
.
çç 
AuthorId
çç $
!=
çç% '
userId
çç( .
)
çç/ 0
{
éé 
return
èè 
Forbid
èè 
(
èè 
)
èè 
;
èè 
}
êê 
updateBlogPost
ëë 
.
ëë 
	UrlHandle
ëë 
=
ëë  
FormatUrlHandle
ëë! 0
(
ëë1 2
updateBlogPost
ëë3 A
.
ëëA B
	UrlHandle
ëëB K
)
ëëL M
;
ëëM N
existingBlogPost
ìì 
.
ìì 
Title
ìì 
=
ìì 
updateBlogPost
ìì -
.
ìì- .
Title
ìì. 3
;
ìì3 4
existingBlogPost
îî 
.
îî 
ShortDescription
îî '
=
îî( )
updateBlogPost
îî* 8
.
îî8 9
ShortDescription
îî9 I
;
îîI J
existingBlogPost
ïï 
.
ïï 
Content
ïï 
=
ïï  
updateBlogPost
ïï! /
.
ïï/ 0
Content
ïï0 7
;
ïï7 8
existingBlogPost
ññ 
.
ññ 
FeaturedImageUrl
ññ '
=
ññ( )
updateBlogPost
ññ* 8
.
ññ8 9
FeaturedImageUrl
ññ9 I
;
ññI J
existingBlogPost
óó 
.
óó 
	UrlHandle
óó  
=
óó! "
updateBlogPost
óó# 1
.
óó1 2
	UrlHandle
óó2 ;
;
óó; <
existingBlogPost
òò 
.
òò 
PublishedDate
òò $
=
òò% &
updateBlogPost
òò' 5
.
òò5 6
PublishedDate
òò6 C
;
òòC D
existingBlogPost
ôô 
.
ôô 
	IsVisible
ôô  
=
ôô! "
updateBlogPost
ôô# 1
.
ôô1 2
	IsVisible
ôô2 ;
;
ôô; <
existingBlogPost
õõ 
.
õõ 

Categories
õõ !
=
õõ" #
new
õõ$ '
List
õõ( ,
<
õõ, -
Category
õõ- 5
>
õõ5 6
(
õõ7 8
)
õõ9 :
;
õõ: ;
if
úú 
(
úú	 

updateBlogPost
úú 
.
úú 

Categories
úú $
?
úú$ %
.
úú% &
Any
úú& )
(
úú* +
)
úú, -
==
úú. 0
true
úú1 5
)
úú6 7
{
ùù 
foreach
ûû 
(
ûû 
var
ûû 
categoryGuid
ûû "
in
ûû# %
updateBlogPost
ûû& 4
.
ûû4 5

Categories
ûû5 ?
)
ûû@ A
{
üü 	
var
††
 
existingCategory
†† 
=
††  
await
††! &!
_categoryRepository
††' :
.
††: ;"
GetCategoryByIdAsync
††; O
(
††O P
categoryGuid
††P \
)
††\ ]
;
††] ^
if
°°
 
(
°° 
existingCategory
°° 
!=
°°  "
null
°°# '
)
°°( )
{
¢¢
 
existingBlogPost
££ 
.
££ 

Categories
££ '
.
££' (
Add
££( +
(
££, -
existingCategory
££. >
)
££? @
;
££@ A
}
§§
 
}
•• 	
}
¶¶ 
var
®® 	
updatedBlogPost
®®
 
=
®® 
await
®® !
_postRepository
®®" 1
.
®®1 2!
UpdateBlogPostAsync
®®2 E
(
®®E F
existingBlogPost
®®F V
)
®®V W
;
®®W X
return
©© 
Ok
©© 
(
©© "
BlogPostMapperHelper
©© &
.
©©& '
MapToDto
©©' /
(
©©0 1
updatedBlogPost
©©2 A
)
©©B C
)
©©D E
;
©©E F
}
™™ 
[
¨¨ 

HttpDelete
¨¨ 
(
¨¨ 
$str
¨¨ 
)
¨¨ 
]
¨¨  
[
≠≠ 
	Authorize
≠≠ 
(
≠≠ 
Roles
≠≠ 
=
≠≠ 
$str
≠≠ '
)
≠≠( )
]
≠≠) *
public
ÆÆ 

async
ÆÆ 
Task
ÆÆ 
<
ÆÆ 
IActionResult
ÆÆ #
>
ÆÆ# $
DeleteBlogPost
ÆÆ% 3
(
ÆÆ4 5
[
ÆÆ6 7
	FromRoute
ÆÆ7 @
]
ÆÆ@ A
Guid
ÆÆB F
id
ÆÆG I
)
ÆÆJ K
{
ØØ 
var
∞∞ 	
existingPost
∞∞
 
=
∞∞ 
await
∞∞ 
_postRepository
∞∞ .
.
∞∞. /"
GetBlogPostByIdAsync
∞∞/ C
(
∞∞C D
id
∞∞D F
)
∞∞F G
;
∞∞G H
if
±± 
(
±±	 

existingPost
±± 
==
±± 
null
±± 
)
±±  !
return
≤≤ 
NotFound
≤≤ 
(
≤≤ 
)
≤≤ 
;
≤≤ 
var
¥¥ 	
user
¥¥
 
=
¥¥ 
await
¥¥ 
_userManager
¥¥ #
.
¥¥# $
GetUserAsync
¥¥$ 0
(
¥¥0 1
User
¥¥1 5
)
¥¥5 6
;
¥¥6 7
if
µµ 
(
µµ	 

user
µµ 
==
µµ 
null
µµ 
)
µµ 
return
∂∂ 
Unauthorized
∂∂ 
(
∂∂ 
)
∂∂ 
;
∂∂  
if
∏∏ 
(
∏∏	 

!
∏∏ 
User
∏∏ 
.
∏∏ 
IsInRole
∏∏ 
(
∏∏ 
$str
∏∏ #
)
∏∏$ %
&&
∏∏& (
existingPost
∏∏) 5
.
∏∏5 6
AuthorId
∏∏6 >
!=
∏∏? A
user
∏∏B F
.
∏∏F G
Id
∏∏G I
)
∏∏J K
return
ππ 
Forbid
ππ 
(
ππ 
$str
ππ <
)
ππ= >
;
ππ> ?
var
ªª 	

deletePost
ªª
 
=
ªª 
await
ªª 
_postRepository
ªª ,
.
ªª, -!
DeleteBlogPostAsync
ªª- @
(
ªª@ A
id
ªªA C
)
ªªC D
;
ªªD E
return
ºº 
Ok
ºº 
(
ºº "
BlogPostMapperHelper
ºº &
.
ºº& '
MapToDto
ºº' /
(
ºº0 1

deletePost
ºº2 <
)
ºº= >
)
ºº? @
;
ºº@ A
}
ΩΩ 
[
øø 
HttpGet
øø 
]
øø 
[
¿¿ 
Route
¿¿ 

(
¿¿ 
$str
¿¿ 
)
¿¿ 
]
¿¿ 
public
¡¡ 

async
¡¡ 
Task
¡¡ 
<
¡¡ 
IActionResult
¡¡ #
>
¡¡# $
GetBlogPostsCount
¡¡% 6
(
¡¡7 8
)
¡¡9 :
{
¬¬ 
var
√√ 	
result
√√
 
=
√√ 
await
√√ 
_postRepository
√√ (
.
√√( )$
GetBlogPostsCountAsync
√√) ?
(
√√? @
)
√√@ A
;
√√A B
return
ƒƒ 
Ok
ƒƒ 
(
ƒƒ 
result
ƒƒ 
)
ƒƒ 
;
ƒƒ 
}
≈≈ 
[
«« 
HttpGet
«« 
]
«« 
[
»» 
Route
»» 

(
»» 
$str
»» 
)
»» 
]
»» 
public
…… 

async
…… 
Task
…… 
<
…… 
IActionResult
…… #
>
……# $
MostViewCount
……% 2
(
……3 4
int
……5 8
count
……9 >
=
……? @
$num
……A B
)
……C D
{
   
try
ÀÀ 	
{
ÃÃ 
var
ÕÕ 
posts
ÕÕ 
=
ÕÕ 
await
ÕÕ 
_postRepository
ÕÕ )
.
ÕÕ) *
GetPopularPosts
ÕÕ* 9
(
ÕÕ9 :
count
ÕÕ: ?
)
ÕÕ? @
;
ÕÕ@ A
var
ŒŒ 
mappedPosts
ŒŒ 
=
ŒŒ 
posts
ŒŒ 
.
ŒŒ  
Select
ŒŒ  &
(
ŒŒ& '"
BlogPostMapperHelper
ŒŒ' ;
.
ŒŒ; <
MapToDto
ŒŒ< D
)
ŒŒD E
.
ŒŒE F
ToList
ŒŒF L
(
ŒŒL M
)
ŒŒM N
;
ŒŒN O
return
œœ 
Ok
œœ 
(
œœ 
mappedPosts
œœ 
)
œœ  !
;
œœ! "
}
–– 
catch
—— 
(
—— 
	Exception
—— 
ex
—— 
)
—— 
{
““ 
_logger
”” 
.
”” 
LogError
”” 
(
”” 
ex
”” 
,
”” 
$str
”” A
)
””B C
;
””C D
return
‘‘ 

StatusCode
‘‘ 
(
‘‘ 
$num
‘‘ 
,
‘‘  
$str
‘‘! Y
)
‘‘Z [
;
‘‘[ \
}
’’ 
}
÷÷ 
[
ÿÿ 
HttpGet
ÿÿ 
(
ÿÿ 
$str
ÿÿ .
)
ÿÿ/ 0
]
ÿÿ0 1
[
ŸŸ 
AllowAnonymous
ŸŸ 
]
ŸŸ 
public
⁄⁄ 

async
⁄⁄ 
Task
⁄⁄ 
<
⁄⁄ 
IActionResult
⁄⁄ #
>
⁄⁄# $(
GetMostViewedPostsByAuthor
⁄⁄% ?
(
⁄⁄@ A
[
⁄⁄B C
	FromRoute
⁄⁄C L
]
⁄⁄L M
string
⁄⁄N T
authorId
⁄⁄U ]
,
⁄⁄] ^
[
⁄⁄_ `
	FromQuery
⁄⁄` i
]
⁄⁄i j
int
⁄⁄k n
count
⁄⁄o t
=
⁄⁄u v
$num
⁄⁄w x
)
⁄⁄y z
{
€€ 
try
‹‹ 	
{
›› 
var
ﬁﬁ 
posts
ﬁﬁ 
=
ﬁﬁ 
await
ﬁﬁ 
_postRepository
ﬁﬁ )
.
ﬁﬁ) **
GetPopularPostsByAuthorAsync
ﬁﬁ* F
(
ﬁﬁF G
authorId
ﬁﬁG O
,
ﬁﬁO P
count
ﬁﬁQ V
)
ﬁﬁV W
;
ﬁﬁW X
var
ﬂﬂ 
mappedPosts
ﬂﬂ 
=
ﬂﬂ 
posts
ﬂﬂ 
.
ﬂﬂ  
Select
ﬂﬂ  &
(
ﬂﬂ& '"
BlogPostMapperHelper
ﬂﬂ' ;
.
ﬂﬂ; <
MapToDto
ﬂﬂ< D
)
ﬂﬂD E
.
ﬂﬂE F
ToList
ﬂﬂF L
(
ﬂﬂL M
)
ﬂﬂM N
;
ﬂﬂN O
return
‡‡ 
Ok
‡‡ 
(
‡‡ 
mappedPosts
‡‡ 
)
‡‡  !
;
‡‡! "
}
·· 
catch
‚‚ 
(
‚‚ 
	Exception
‚‚ 
ex
‚‚ 
)
‚‚ 
{
„„ 
_logger
‰‰ 
.
‰‰ 
LogError
‰‰ 
(
‰‰ 
ex
‰‰ 
,
‰‰ 
$str
‰‰ N
)
‰‰O P
;
‰‰P Q
return
ÂÂ 

StatusCode
ÂÂ 
(
ÂÂ 
$num
ÂÂ 
,
ÂÂ  
$str
ÂÂ! N
)
ÂÂO P
;
ÂÂP Q
}
ÊÊ 
}
ÁÁ 
[
ÎÎ 
HttpGet
ÎÎ 
(
ÎÎ 
$str
ÎÎ &
)
ÎÎ' (
]
ÎÎ( )
public
ÏÏ 

async
ÏÏ 
Task
ÏÏ 
<
ÏÏ 
IActionResult
ÏÏ #
>
ÏÏ# $
GetRelatedPosts
ÏÏ% 4
(
ÏÏ5 6
[
ÏÏ7 8
	FromRoute
ÏÏ8 A
]
ÏÏA B
Guid
ÏÏC G
postId
ÏÏH N
)
ÏÏO P
{
ÌÌ 
var
ÓÓ 	
relatedPosts
ÓÓ
 
=
ÓÓ 
await
ÓÓ 
_postRepository
ÓÓ .
.
ÓÓ. /"
GetRelatedPostsAsync
ÓÓ/ C
(
ÓÓC D
postId
ÓÓD J
)
ÓÓJ K
;
ÓÓK L
var
ÔÔ 	
mapped
ÔÔ
 
=
ÔÔ 
relatedPosts
ÔÔ 
.
ÔÔ  
Select
ÔÔ  &
(
ÔÔ& '"
BlogPostMapperHelper
ÔÔ' ;
.
ÔÔ; <
MapToDto
ÔÔ< D
)
ÔÔD E
.
ÔÔE F
ToList
ÔÔF L
(
ÔÔL M
)
ÔÔM N
;
ÔÔN O
return
 
Ok
 
(
 
mapped
 
)
 
;
 
}
ÒÒ 
private
ÛÛ 
string
ÛÛ 
FormatUrlHandle
ÛÛ "
(
ÛÛ# $
string
ÛÛ% +
	urlHandle
ÛÛ, 5
)
ÛÛ6 7
{
ÙÙ 
if
ıı 
(
ıı	 

string
ıı 
.
ıı 
IsNullOrEmpty
ıı 
(
ıı  !
	urlHandle
ıı" +
)
ıı, -
)
ıı. /
return
ˆˆ 
string
ˆˆ 
.
ˆˆ 
Empty
ˆˆ 
;
ˆˆ 
return
¯¯ 
	urlHandle
¯¯ 
.
˘˘
 
ToLowerInvariant
˘˘ 
(
˘˘ 
)
˘˘ 
.
˙˙
 
Trim
˙˙ 
(
˙˙ 
)
˙˙ 
.
˚˚
 
Replace
˚˚ 
(
˚˚ 
$str
˚˚ 
,
˚˚ 
$str
˚˚ 
)
˚˚ 
.
¸¸
 
Replace
¸¸ 
(
¸¸ 
$str
¸¸ 
,
¸¸ 
$str
¸¸ 
)
¸¸  
.
˝˝
 
Replace
˝˝ 
(
˝˝ 
$str
˝˝ #
,
˝˝# $
$str
˝˝% '
)
˝˝( )
.
˛˛
 
Replace
˛˛ 
(
˛˛ 
$str
˛˛ 
,
˛˛ 
$str
˛˛ 
)
˛˛  
;
˛˛  !
}
ˇˇ 
}
ÄÄ 
}ÑÑ ìM
\C:\Users\Pichau\Desktop\sameer\API\CodePulse.API\CodePulse.API\Controllers\AuthController.cs
	namespace 	
	CodePulse
 
. 
API 
. 
Controllers #
{		 
[

 
Route

 
(

	 

$str

 
)

 
]

  
[ 
ApiController 
] 
public 
class	 
AuthController 
: 
ControllerBase  .
{ 
private 
readonly 
UserManager  
<  !
UserProfile! ,
>, -
_userManager. :
;: ;
private 
readonly 
ITokenRepository %
_tokenRepository& 6
;6 7
private 
readonly 
IMapper 
_mapper $
;$ %
private 
readonly 
ILogger 
< 
AuthController +
>+ ,
_logger- 4
;4 5
public 

AuthController 
( 
UserManager 
< 
UserProfile 
>  
userManager! ,
,, -
ITokenRepository 
tokenRepository (
,( )
IMapper 
mapper 
, 
ILogger 
< 
AuthController 
> 
logger  &
)' (
{ 
_userManager 
= 
userManager  
;  !
_tokenRepository 
= 
tokenRepository (
;( )
_mapper 
= 
mapper 
; 
_logger 
= 
logger 
; 
} 
[ 
HttpPost 
] 
[   
Route   

(   
$str   
)   
]   
public!! 

async!! 
Task!! 
<!! 
IActionResult!! #
>!!# $
login!!% *
(!!+ ,
[!!- .
FromBody!!. 6
]!!6 7
LoginRequestDto!!8 G
request!!H O
)!!P Q
{"" 
_logger## 
.## 
LogInformation## 
(## 
$str## A
,##A B
request##C J
.##J K
Email##K P
)##Q R
;##R S
if%% 
(%%	 

string%% 
.%% 
IsNullOrEmpty%% 
(%%  !
request%%" )
.%%) *
Email%%* /
)%%0 1
||%%2 4
string%%5 ;
.%%; <
IsNullOrEmpty%%< I
(%%J K
request%%L S
.%%S T
Password%%T \
)%%] ^
)%%_ `
{&& 
_logger'' 
.'' 

LogWarning'' 
('' 
$str'' G
)''H I
;''I J

ModelState(( 
.(( 
AddModelError((  
(((! "
$str((# %
,((% &
$str((' H
)((I J
;((J K
return)) 
ValidationProblem))  
())! "

ModelState))# -
))). /
;))/ 0
}** 
var-- 	
user--
 
=-- 
await-- 
_userManager-- #
.--# $
FindByEmailAsync--$ 4
(--4 5
request--5 <
.--< =
Email--= B
)--B C
;--C D
if.. 
(..	 

user.. 
is.. 
not.. 
null.. 
).. 
{// 
_logger00 
.00 
LogInformation00 
(00  
$str00! A
,00A B
request00C J
.00J K
Email00K P
)00Q R
;00R S
var33 
password33 
=33 
await33 
_userManager33 )
.33) *
CheckPasswordAsync33* <
(33< =
user33= A
,33A B
request33C J
.33J K
Password33K S
)33S T
;33T U
if44 

(44 
password44 
)44 
{55 	
_logger66
 
.66 
LogInformation66  
(66! "
$str66# G
,66G H
request66I P
.66P Q
Email66Q V
)66W X
;66X Y
var99
 
roles99 
=99 
await99 
_userManager99 (
.99( )
GetRolesAsync99) 6
(996 7
user997 ;
)99; <
;99< =
_logger::
 
.:: 
LogInformation::  
(::! "
$str::# 8
,::8 9
string::: @
.::@ A
Join::A E
(::F G
$str::H L
,::L M
roles::N S
)::T U
)::V W
;::W X
var<<
 
jwtToken<< 
=<< 
_tokenRepository<< )
.<<) *
CreateJwtToken<<* 8
(<<8 9
user<<9 =
,<<= >
roles<<? D
.<<D E
ToList<<E K
(<<K L
)<<L M
)<<M N
;<<N O
var==
 
response== 
=== 
new== 
LoginResponseDto== -
{>>
 
Email?? 
=?? 
request?? 
.?? 
Email?? !
,??! "
Roles@@ 
=@@ 
roles@@ 
.@@ 
ToList@@  
(@@  !
)@@! "
,@@" #
TokenAA 
=AA 
jwtTokenAA 
,AA 
UserNameBB 
=BB 
userBB 
.BB 
UserNameBB $
??BB% '
stringBB( .
.BB. /
EmptyBB/ 4
,BB4 5
FullNameCC 
=CC 
userCC 
.CC 
FullNameCC $
}DD
 
;DD 
returnEE
 
OkEE 
(EE 
responseEE 
)EE  
;EE  !
}FF 	
elseGG 
{HH 	
_loggerII
 
.II 

LogWarningII 
(II 
$strII E
,IIE F
requestIIG N
.IIN O
EmailIIO T
)IIU V
;IIV W
}JJ 	
}KK 
elseLL 

{MM 
_loggerNN 
.NN 

LogWarningNN 
(NN 
$strNN A
,NNA B
requestNNC J
.NNJ K
EmailNNK P
)NNQ R
;NNR S
}OO 

ModelStateQQ 
.QQ 
AddModelErrorQQ 
(QQ  
$strQQ! #
,QQ# $
$strQQ% B
)QQC D
;QQD E
returnRR 
ValidationProblemRR 
(RR  

ModelStateRR! +
)RR, -
;RR- .
}SS 
[VV 
HttpPostVV 
(VV 
$strVV 
)VV 
]VV 
publicWW 

asyncWW 
TaskWW 
<WW 
IActionResultWW #
>WW# $
RegisterWW% -
(WW. /
[WW0 1
FromBodyWW1 9
]WW9 :
RegisterRequestDtoWW; M
registerDtoWWN Y
)WWZ [
{XX 
varZZ 	
existingUserZZ
 
=ZZ 
awaitZZ 
_userManagerZZ +
.ZZ+ ,
FindByEmailAsyncZZ, <
(ZZ< =
registerDtoZZ= H
.ZZH I
EmailZZI N
)ZZN O
;ZZO P
if[[ 
([[	 

existingUser[[ 
!=[[ 
null[[ 
)[[  !
{\\ 
return]] 

BadRequest]] 
(]] 
$str]] 4
)]]5 6
;]]6 7
}^^ 
var`` 	
existingUsername``
 
=`` 
await`` "
_userManager``# /
.``/ 0
FindByNameAsync``0 ?
(``? @
registerDto``@ K
.``K L
UserName``L T
)``T U
;``U V
ifaa 
(aa	 

existingUsernameaa 
!=aa 
nullaa #
)aa$ %
{bb 
returncc 

BadRequestcc 
(cc 
$strcc =
)cc> ?
;cc? @
}dd 
vargg 	
userProfilegg
 
=gg 
newgg 
UserProfilegg '
{hh 
UserNameii 
=ii 
registerDtoii 
.ii 
UserNameii '
,ii' (
Emailjj 
=jj 
registerDtojj 
.jj 
Emailjj !
,jj! "
FullNamekk 
=kk 
registerDtokk 
.kk 
FullNamekk '
,kk' (
Bioll 
=ll 
registerDtoll 
.ll 
Bioll 
}mm 
;mm 
varoo 	
resultoo
 
=oo 
awaitoo 
_userManageroo %
.oo% &
CreateAsyncoo& 1
(oo1 2
userProfileoo2 =
,oo= >
registerDtooo? J
.ooJ K
PasswordooK S
)ooS T
;ooT U
ifqq 
(qq	 

!qq 
resultqq 
.qq 
	Succeededqq 
)qq 
{rr 
returnss 

BadRequestss 
(ss 
resultss "
.ss" #
Errorsss# )
)ss* +
;ss+ ,
}tt 
awaitww 
_userManagerww 
.ww 
AddToRoleAsyncww '
(ww( )
userProfileww* 5
,ww5 6
$strww7 =
)ww> ?
;ww? @
varzz 	
responsezz
 
=zz 
_mapperzz 
.zz 
Mapzz  
<zz  !
RegisterResponseDtozz! 4
>zz4 5
(zz5 6
userProfilezz6 A
)zzA B
;zzB C
return|| 
Ok|| 
(|| 
response|| 
)|| 
;|| 
}}} 
}~~ 
} 