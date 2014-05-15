Received: from mailapp01.imgtec.com ([195.59.15.196]:26947 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6816841AbaEOIUrFrbg5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 15 May 2014 10:20:47 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 09768BC36F7A1
        for <linux-mips@linux-mips.org>; Thu, 15 May 2014 09:20:39 +0100 (IST)
Message-ID: <537478D7.2000403@imgtec.com>
Date: Thu, 15 May 2014 09:20:39 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] MIPS: lib: csum_partial: more instruction paral
References: <1400137743-8806-1-git-send-email-chenj@lemote.com>
In-Reply-To: <1400137743-8806-1-git-send-email-chenj@lemote.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Message-ID: <20140515082039.3233wVwb3ppWR7UjzRvVHQTLYHYQL3ofutZTF2Sx1Ns@z>

On 05/15/2014 08:09 AM, chenj wrote:
> This will bring at most 50% performance gain on loongson3a.
> See
> http://dev.lemote.com/files/upload/software/csum-opti/csum-opti-benchmark.html
> 
> The benchmark is done in userspace through
> http://dev.lemote.com/files/upload/software/csum-opti/csum-test.tar.gz
> ---
>  arch/mips/lib/csum_partial.S | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)

Hi chenj,

My opinion is that the commit message is not ideal. If the http links
ever go away, the commit message will be mostly useless for someone
trying to understand the reason for this patch. I would suggest to
explain the reason for the optimizations in the commit message and put
the http links as a comment to this patch which will still be visible in
the mailing list archives. Or you can keep them in the commit message
but I think the reason for the patch should be explained as well.

-- 
markos
