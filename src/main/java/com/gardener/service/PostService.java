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

  public Post findPostByPostnum(Long postnum) {
    return postMapper.findBypostnum(postnum);
  }

  public List<Post> findAllPost() {
    List<Post> posts = postMapper.findAll();
    return posts;
  }

  public Long updatePostByPostnum(Post post) {
    Long result = postMapper.updatePost(post);
    return result;
  }

  public Long deletePostByPostnum(Long postnum) {
    postMapper.deletePost(postnum);
    return postnum;
  }

}
