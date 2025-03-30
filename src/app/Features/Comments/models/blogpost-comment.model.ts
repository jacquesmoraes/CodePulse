export interface BlogPostComment{
    id:string;
    blogPostId: string;
    content: string;
  author: string;
  createdAt: Date;
}