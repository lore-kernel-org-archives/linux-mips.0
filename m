Return-Path: <SRS0=ufB7=7T=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053E2C433E0
	for <linux-mips@archiver.kernel.org>; Sat,  6 Jun 2020 01:08:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3A1920772
	for <linux-mips@archiver.kernel.org>; Sat,  6 Jun 2020 01:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591405686;
	bh=JdeeZEG/s9PJWjwa/MTfv/JgYtVWchaFYWKs9Z3jNuE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=PLbXK8Vxpw+JMQY4PB63LpXGnS5VYe9Sehr/ON2JyR6xVa4Ze4pya51CEZ0VYlZj5
	 Uo6OvIF9Rf7r9C0jdvLxPf7TxnenCcUdwNDjNIdfjrpkoP+939UP6NOYxUCXPdEpXR
	 63e1YGJO9C8zorjogo4+jiIkjU30rdIMqUKqFG/o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728316AbgFFBIG (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 5 Jun 2020 21:08:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:58894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726803AbgFFBIG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 5 Jun 2020 21:08:06 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2546820723;
        Sat,  6 Jun 2020 01:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591405684;
        bh=JdeeZEG/s9PJWjwa/MTfv/JgYtVWchaFYWKs9Z3jNuE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=vw2MqBpJYwqq+09ZZ6vagDXamXK2QaHHbzr5ql5vspav6hv4YZxBA9Sa4ChzzdwfO
         f/Dh52fmkY9R8vhHgQz9fdtpn+TjCFlhSMwVVdtJ9ubadfm0w+RJfmxoaoYNQKAW1k
         SmUDydhrZ/piDRkHlyEgWO2OdyChN5IIcEAyO+5E=
Date:   Fri, 5 Jun 2020 18:08:03 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Bibo Mao <maobibo@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 1/2] MIPS: set page access bit with pgprot on some MIPS
 platform
Message-Id: <20200605180803.9ba58249ed681f4da9822f43@linux-foundation.org>
In-Reply-To: <1591348266-28392-1-git-send-email-maobibo@loongson.cn>
References: <1591348266-28392-1-git-send-email-maobibo@loongson.cn>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri,  5 Jun 2020 17:11:05 +0800 Bibo Mao <maobibo@loongson.cn> wrote:

> On MIPS system which has rixi hardware bit, page access bit is not
> set in pgrot. For memory reading, there will be one page fault to
> allocate physical page; however valid bit is not set, there will
> be the second fast tlb-miss fault handling to set valid/access bit.
> 
> This patch set page access/valid bit with pgrot if there is reading
> access privilege. It will reduce one tlb-miss handling for memory
> reading access.
> 
> The valid/access bit will be cleared in order to track memory
> accessing activity. If the page is accessed, tlb-miss fast handling
> will set valid/access bit, pte_sw_mkyoung is not necessary in slow
> page fault path. This patch removes pte_sw_mkyoung function which
> is defined as empty function except MIPS system.
> 
> ...
>
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2704,7 +2704,6 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
>  		}
>  		flush_cache_page(vma, vmf->address, pte_pfn(vmf->orig_pte));
>  		entry = mk_pte(new_page, vma->vm_page_prot);
> -		entry = pte_sw_mkyoung(entry);
>  		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
>  		/*
>  		 * Clear the pte entry and flush it first, before updating the
> @@ -3379,7 +3378,6 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
>  	__SetPageUptodate(page);
>  
>  	entry = mk_pte(page, vma->vm_page_prot);
> -	entry = pte_sw_mkyoung(entry);
>  	if (vma->vm_flags & VM_WRITE)
>  		entry = pte_mkwrite(pte_mkdirty(entry));
>  
> @@ -3662,7 +3660,6 @@ vm_fault_t alloc_set_pte(struct vm_fault *vmf, struct mem_cgroup *memcg,
>  
>  	flush_icache_page(vma, page);
>  	entry = mk_pte(page, vma->vm_page_prot);
> -	entry = pte_sw_mkyoung(entry);
>  	if (write)
>  		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
>  	/* copy-on-write page */

Only affects mips, so cheerily

Acked-by: Andrew Morton <akpm@linux-foundation.org>
