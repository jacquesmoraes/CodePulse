import { Category } from "../../Categories/models/category.model";
import { BlogPostAuthor } from "./blogpost-author.model";

export interface BlogPost {
    id: string;
    title: string;
    urlHandle: string;
    shortDescription: string;
    featuredImageUrl: string;
    content: string;
    publishedDate: Date;
    isVisible: boolean;
    author: BlogPostAuthor;
    categories: Category[];
    viewCount: number;
}