export interface CreateUserRequest {
  fullName: string;
  userName: string;
  email: string;
  bio?: string;
  password: string;
  role: 'Writer' | 'User'; // aceita apenas Writer ou User
}
