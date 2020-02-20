Return-Path: <SRS0=+hMZ=4I=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332A3C5ACC4
	for <linux-mips@archiver.kernel.org>; Thu, 20 Feb 2020 03:16:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F2FE524656
	for <linux-mips@archiver.kernel.org>; Thu, 20 Feb 2020 03:16:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbgBTDQu (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 19 Feb 2020 22:16:50 -0500
Received: from smtprelay0049.hostedemail.com ([216.40.44.49]:48533 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727208AbgBTDQu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 19 Feb 2020 22:16:50 -0500
X-Greylist: delayed 414 seconds by postgrey-1.27 at vger.kernel.org; Wed, 19 Feb 2020 22:16:49 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave02.hostedemail.com (Postfix) with ESMTP id E838818013824
        for <linux-mips@vger.kernel.org>; Thu, 20 Feb 2020 03:09:55 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id 67E1B182CED28;
        Thu, 20 Feb 2020 03:09:54 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: tank61_1c33f32e6735c
X-Filterd-Recvd-Size: 1433
Received: from XPS-9350.home (unknown [47.151.143.254])
        (Authenticated sender: joe@perches.com)
        by omf12.hostedemail.com (Postfix) with ESMTPA;
        Thu, 20 Feb 2020 03:09:53 +0000 (UTC)
Message-ID: <cfeab22c0f332418d25e56fa86f5420f5470e4ee.camel@perches.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: Set MIPS status to Odd Fixes
From:   Joe Perches <joe@perches.com>
To:     Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Date:   Wed, 19 Feb 2020 19:08:30 -0800
In-Reply-To: <20200219191730.1277800-3-paulburton@kernel.org>
References: <20200219191730.1277800-1-paulburton@kernel.org>
         <20200219191730.1277800-3-paulburton@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 2020-02-19 at 11:17 -0800, Paul Burton wrote:
> My time with MIPS the company has reached its end, and so at best I'll
> have little time spend on maintaining arch/mips/. Reflect that in
> MAINTAINERS by changing status to Odd Fixes. Hopefully this might spur
> the involvement of someone with more time, but even if not it should
> help serve to avoid unrealistic expectations.
[]
> diff --git a/MAINTAINERS b/MAINTAINERS
[]
> @@ -11120,7 +11120,7 @@ W:	http://www.linux-mips.org/
>  T:	git git://git.linux-mips.org/pub/scm/ralf/linux.git

Maybe Ralf's T: entry should be removed too.


