package com.gardener.service;

import com.gardener.domain.Post;
import com.gardener.mappers.PostMapper;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class PostService {

  private final PostMapper postMapper;


  public Long savePost(Post post) {
    postMapper.insert(post);
    return post.getPostnum();
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
