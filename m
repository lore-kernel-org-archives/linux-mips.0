Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F34B6C433E0
	for <linux-mips@archiver.kernel.org>; Tue, 16 Mar 2021 05:19:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C06F564FCA
	for <linux-mips@archiver.kernel.org>; Tue, 16 Mar 2021 05:19:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235231AbhCPFSa (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 16 Mar 2021 01:18:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231837AbhCPFSK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 16 Mar 2021 01:18:10 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1234::107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9854EC06174A;
        Mon, 15 Mar 2021 22:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=m2wlbrLXHGON0ztmTAjK9CypdMjp3CW2spuglhCeX9w=; b=NawVP1nUT9d9PzmC6+dbotGLyu
        6l3wiDPm/fIA6eep9py0CdMN9PrdNv0NKPZaE5LtNIS7Yu4AjHSFqhzmaqwTKEH6IQZ2q9tUfKMi5
        eRAIZm1n0rgHefQyz8R/+0/7GusNnRHb0B+zCUmsHfbDRoYthAr6x7hDqLl7X/IVqAGUCcPm4pc9h
        Z67mTXQMhNbYmHCT0E5lB335A53EO5fJWLJvFEW9VrYzB3JkILVM99Vs8l0cegqLDqk7GFg4Padad
        Dv40QJe3VRN4YWDExCDaA8F/CoRvCwbFyKceAQ6nqg0CKD4pnZQVlSfnJiPmFdC5DgBcnh3/9uSRL
        DPpdbw3A==;
Received: from [2601:1c0:6280:3f0::9757]
        by merlin.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lM25o-001PQj-6V; Tue, 16 Mar 2021 05:18:08 +0000
Subject: Re: [PATCH V2] mips: asm: octeon: A typo fix in the file
 cvmx-address.h
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210316043334.2770025-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7a624cf1-45ef-81b9-0340-baa7cde39950@infradead.org>
Date:   Mon, 15 Mar 2021 22:18:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316043334.2770025-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 3/15/21 9:33 PM, Bhaskar Chowdhury wrote:
> 
> s/techically/technically/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Changes from V1:
>  Meh, missed the changelog text, so added :)
> 
>  arch/mips/include/asm/octeon/cvmx-address.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/include/asm/octeon/cvmx-address.h b/arch/mips/include/asm/octeon/cvmx-address.h
> index e4444f8c4a61..5df5c90f6a5d 100644
> --- a/arch/mips/include/asm/octeon/cvmx-address.h
> +++ b/arch/mips/include/asm/octeon/cvmx-address.h
> @@ -152,7 +152,7 @@ typedef union {
> 
>  	/* physical mem address */
>  	struct {
> -		/* techically, <47:40> are dont-cares */
> +		/* technically, <47:40> are dont-cares */
>  		uint64_t zeroes:24;
>  		/* the hardware ignores <39:36> in Octeon I */
>  		uint64_t unaddr:4;
> --


-- 
~Randy

