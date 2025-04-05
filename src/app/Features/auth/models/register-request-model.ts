export interface RegisterRequest {
    userName: string;
    email: string;
    password: string;
    fullName: string;
    bio?: string;
    photoUrl?: string;
}