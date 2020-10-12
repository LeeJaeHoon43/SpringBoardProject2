package com.ljh.mvcboard.article.controller;

import java.util.List;

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
import com.ljh.mvcboard.commons.paging.PageMaker;
import com.ljh.mvcboard.commons.paging.SearchCriteria;
import com.ljh.mvcboard.reply.service.ReplyService;

@Controller
@RequestMapping("/article/paging/search")
public class ArticlePagingSearchController {

	private static final Logger logger = LoggerFactory.getLogger(ArticlePagingSearchController.class);

	private final ArticleService articleService;
	private final ReplyService replyService;

	@Inject
	public ArticlePagingSearchController(ArticleService articleService, ReplyService replyService) {
		this.articleService = articleService;
		this.replyService = replyService;
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGET(@ModelAttribute("searchCriteria") SearchCriteria searchCriteria) throws Exception {
		return "article/search/write";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(ArticleVO articleVO, RedirectAttributes redirectAttributes) throws Exception {
		articleService.create(articleVO);
		redirectAttributes.addFlashAttribute("msg", "regSuccess");
		return "redirect:/article/paging/search/list";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@ModelAttribute("searchCriteria") SearchCriteria searchCriteria, Model model)throws Exception{
		logger.info("search list");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(searchCriteria);
		//    	pageMaker.setTotalCount(articleService.countArticles(searchCriteria));
		pageMaker.setTotalCount(articleService.countSearchedArticles(searchCriteria));
		//    	model.addAttribute("articles", articleService.listCriteria(searchCriteria));
		model.addAttribute("articles", articleService.listSearch(searchCriteria));
		List<ArticleVO> articles = articleService.listSearch(searchCriteria);
		int articleNumber = 0;
		for (ArticleVO article : articles) {
			articleNumber = article.getArticleNo();
		}
		System.out.println("게시물 번호 : " + articleNumber);
		System.out.println("댓글 갯수 : " + replyService.countReplies(articleNumber));
		model.addAttribute("replyCnt", replyService.countReplies(articleNumber));
		model.addAttribute("pageMaker", pageMaker);
		return "article/search/list";	
	}

	// 조회 페이지.
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(@RequestParam("articleNo") int articleNo, @ModelAttribute("searchCriteria") SearchCriteria searchCriteria, Model model) throws Exception{
		logger.info("search read");
		model.addAttribute("article", articleService.read(articleNo));
		return "article/search/read";
	}

	// 수정 페이지.
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("articleNo") int articleNo, @ModelAttribute("searchCriteria") SearchCriteria searchCriteria, Model model) throws Exception {
		logger.info(searchCriteria.toString());
		model.addAttribute("article", articleService.read(articleNo));
		return "article/search/modify";
	}

	// 수정 처리.
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(ArticleVO articleVO, SearchCriteria searchCriteria, RedirectAttributes redirectAttributes) throws Exception {
		articleService.update(articleVO);
		redirectAttributes.addAttribute("page", searchCriteria.getPage());
		redirectAttributes.addAttribute("perPageNum", searchCriteria.getPerPageNum());
		redirectAttributes.addAttribute("searchType", searchCriteria.getSearchType());
		redirectAttributes.addAttribute("keyword", searchCriteria.getKeyword());
		redirectAttributes.addFlashAttribute("msg", "modSuccess");
		return "redirect:/article/paging/search/list";
	}

	// 삭제 처리.
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("articleNo") int articleNo, SearchCriteria searchCriteria, RedirectAttributes redirectAttributes) throws Exception {
		articleService.delete(articleNo);
		redirectAttributes.addAttribute("page", searchCriteria.getPage());
		redirectAttributes.addAttribute("perPageNum", searchCriteria.getPerPageNum());
		redirectAttributes.addAttribute("searchType", searchCriteria.getSearchType());
		redirectAttributes.addAttribute("keyword", searchCriteria.getKeyword());
		redirectAttributes.addFlashAttribute("msg", "delSuccess");
		return "redirect:/article/paging/search/list";
	}
}
