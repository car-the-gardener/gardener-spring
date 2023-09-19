package com.gardener.service;


import com.gardener.aop.exception.FindException;
import com.gardener.domain.Reply;
import com.gardener.mappers.ReplyMapper;
import com.gardener.util.Criteria;
import com.gardener.util.ReplyPaging;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ReplyService {

  private final ReplyMapper mapper;

  public int insert(Reply reply) {
    return mapper.insert(reply);
  }

  public Reply findById(Long id) throws FindException {
    return mapper.findById(id);
  }

  public List<Reply> findAll(Criteria cri, Long postId) throws FindException {
    return mapper.findAll(cri, postId);
  }

  public int delete(Long id) {
    return mapper.delete(id);
  }

  public int update(Reply reply) {
    return mapper.update(reply);
  }

  public int count(Long postId) {
    return mapper.count(postId);
  }

}

