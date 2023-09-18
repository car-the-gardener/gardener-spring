package com.gardener.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gardener.domain.Post;
import com.gardener.mappers.PostMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PostService {

	private final PostMapper postMapper;

	public Long savePost(Post post) {
		postMapper.insert(post);
		return post.getId();
	}

	public Post findPostById(Long id) {
		Post post = postMapper.findById(id);
		return post;
	}

	public List<Post> findAllPost() {
		List<Post> posts = postMapper.findAll();
		return posts;
	}
}
