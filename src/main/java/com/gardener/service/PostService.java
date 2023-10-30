package com.gardener.service;

import com.gardener.domain.Post;
import com.gardener.mappers.PostMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

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

  public Long updatePostByPostnum(Post post) {
    return postMapper.updatePost(post);
  }

  public void updateFvorite(Long postnum, int favorite) {
    postMapper.updateFavorite(postnum, favorite);
  }

  public Long deletePostByPostnum(Long postnum) {
    postMapper.deletePost(postnum);
    return postnum;
  }

}
