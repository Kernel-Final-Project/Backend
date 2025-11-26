package com.ocp.ocp_finalproject.content.domain;

import com.ocp.ocp_finalproject.common.entity.BaseEntity;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@Table(name = "blog_post")
public class BlogPost extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "blog_post_id")
    private Long blogPostId;

    @Column(name = "blog_post_url", nullable = false)
    private String blogPostUrl;

    @Enumerated(EnumType.STRING)
    private BlogPostStatus status;

    // 정적 팩토리 메서드
    @Builder(builderMethodName = "createBuilder")
    public static BlogPost create(String blogPostUrl, BlogPostStatus status) {
        BlogPost post = new BlogPost();
        post.blogPostUrl = blogPostUrl;
        post.status = status;
        return post;
    }
}
