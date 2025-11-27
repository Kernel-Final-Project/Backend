package com.ocp.ocp_finalproject.content.domain;

import com.ocp.ocp_finalproject.common.entity.BaseEntity;
import com.ocp.ocp_finalproject.content.enums.PostStatus;
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
    private PostStatus status;

    @OneToOne
    @JoinColumn(name = "work_id", nullable = false)
    private Work work;

    @Builder(builderMethodName = "createBuilder")
    public static BlogPost create(
            String blogPostUrl,
            PostStatus status,
            Work work
    ) {
        BlogPost post = new BlogPost();
        post.blogPostUrl = blogPostUrl;
        post.status = status;
        post.setWork(work);  // ★ 양방향 자동 연결 처리
        return post;
    }

    // 편의 메서드
    public void setWork(Work work) {
        this.work = work;
        if (work.getBlogPost() != this) {
            work.setBlogPost(this);
        }
    }
}
