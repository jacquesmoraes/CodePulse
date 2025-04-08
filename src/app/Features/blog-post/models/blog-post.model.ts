import { Category } from "../../Categories/models/category.model";
import { BlogPostAuthor } from "./blogpost-author.model";

export interface BlogPost {
    id: string;
    title: string;
    shortDescription: string;
    content: string;
    featuredImageUrl: string;
    urlHandle: string;
    publishedDate: Date;
    isVisible: boolean;
    author: BlogPostAuthor;
    categories: Category[];
    viewCount: number;
}