package com.ocp.ocp_finalproject.blog.repository;

import com.ocp.ocp_finalproject.blog.domain.UserBlog;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserBlogRepository extends JpaRepository<UserBlog, Long> {
}