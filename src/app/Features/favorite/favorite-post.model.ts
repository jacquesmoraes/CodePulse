export interface FavoritePost{
    id: string;
    userId: string;
    blogPostId: string;
    blogPostTitle: string;
    blogPostUrlHandle: string;
    blogPostImageUrl: string;
    authorUserName: string;
    authorImageUrl?: string;
    favoritedAt: string;
}