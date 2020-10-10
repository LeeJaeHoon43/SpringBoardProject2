package com.ljh.mvcboard.article.controller;

import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.ljh.mvcboard.article.domain.ArticleVO;
import com.ljh.mvcboard.article.service.ArticleService;
import com.ljh.mvcboard.commons.paging.Criteria;
import com.ljh.mvcboard.commons.paging.PageMaker;

@Controller
@RequestMapping(value = "/article/paging")
public class ArticlePagingController {
	private static final Logger logger = LoggerFactory.getLogger(ArticlePagingController.class);

	private final ArticleService articleService;

	@Inject
	public ArticlePagingController(ArticleService articleService) {
		this.articleService = articleService;
	}

	// 등록 페이지 이동.
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGET() {
		logger.info("paging write GET");
		return "/article/paging/write";
	}

	// 등록 처리.
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(ArticleVO articleVO, RedirectAttributes rttr) throws Exception{
		logger.info("paging write POST");
		logger.info(articleVO.toString());
		articleService.create(articleVO);
		rttr.addFlashAttribute("msg", "regSuccess");
		return "redirect:/article/paging/list";
	}

	// 페이지 번호 출력처리가 된 목록 페이지 처리.
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPaging(Model model, Criteria criteria) throws Exception{
		logger.info("paging list");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(articleService.countArticles(criteria)); // 게시물 총 갯수 구하기.
		model.addAttribute("articles", articleService.listCriteria(criteria));
		model.addAttribute("pageMaker", pageMaker);
		return "/article/paging/list";
	}

	// 
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String readPaging(@RequestParam("articleNo") int articleNo, @ModelAttribute("criteria") Criteria criteria, Model model) throws Exception{
		logger.info("paging read");
		model.addAttribute("article", articleService.read(articleNo));
		return "/article/paging/read";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("articleNo") int articleNo, @ModelAttribute("criteria") Criteria criteria, Model model) throws Exception{
		logger.info("paging modifyGet");
		model.addAttribute("article", articleService.read(articleNo));
		return "/article/paging/modify";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(ArticleVO articleVO, Criteria criteria, RedirectAttributes redirectAttributes) throws Exception{
		logger.info("paging modifyPost");
		articleService.update(articleVO);
		redirectAttributes.addAttribute("page", criteria.getPage());
		redirectAttributes.addAttribute("perPageNum", criteria.getPerPageNum());
		redirectAttributes.addFlashAttribute("msg", "modSuccess");
		return "redirect:/article/paging/list";
	}

	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("articleNo") int articleNo, Criteria criteria, RedirectAttributes redirectAttributes) throws Exception{
		logger.info("paging remove");
		articleService.delete(articleNo);
		redirectAttributes.addAttribute("page", criteria.getPage());
		redirectAttributes.addAttribute("perPageNum", criteria.getPerPageNum());
		redirectAttributes.addFlashAttribute("msg", "delSuccess");
		return "redirect:/article/paging/list";
	}	
}
