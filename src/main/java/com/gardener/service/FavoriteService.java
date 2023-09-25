package com.gardener.service;

import com.gardener.domain.Post;
import com.gardener.domain.dto.FavoriteDTO;
import com.gardener.mappers.FavoriteMapper;
import com.gardener.mappers.PostMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class FavoriteService {

  private final PostMapper postMapper;
  private final FavoriteMapper favoriteMapper;

  @Transactional
  public void insertFavorite(Long postnum, String loginid) {
    FavoriteDTO dto = new FavoriteDTO(postnum, loginid);
    favoriteMapper.insertFavorite(dto);
    List<FavoriteDTO> favorite = favoriteMapper.findFavoriteByLoginid(dto);
    log.info("favorite =>");
    log.info("{}", favorite);
    log.info("size = > {}", favorite.size());
    Post post = postMapper.findBypostnum(postnum);

    if (favorite.size() > 1) {
      throw new IllegalStateException("이미 존재");
    }

    postMapper.updateFavorite(postnum, post.getFavorite() + 1);
  }

  @Transactional
  public void deleteFavorite(Long postnum, String loginid) {
    favoriteMapper.deleteFavorite(new FavoriteDTO(postnum, loginid));
    Post post = postMapper.findBypostnum(postnum);
    int favorite = post.getFavorite();
    if (favorite < 0) {
      throw new IllegalStateException("좋아요 수가 0 이하");
    }
    postMapper.updateFavorite(postnum, favorite - 1);
  }
}
