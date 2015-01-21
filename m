Received: from resqmta-ch2-10v.sys.comcast.net ([69.252.207.42]:32958 "EHLO
        resqmta-ch2-10v.sys.comcast.net" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27011973AbbAULiEZ3q15 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 Jan 2015 12:38:04 +0100
Message-ID: <54BF8F8C.4090209@gentoo.org>
Date: Wed, 21 Jan 2015 06:37:48 -0500
From: Joshua Kinard <kumba@gentoo.org>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: R10000: Split R10000 definitions from R12000 and
 up
References: <54BCC6CB.7020804@gentoo.org>
In-Reply-To: <54BCC6CB.7020804@gentoo.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-Path: <kumba@gentoo.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Linux MIPS List <linux-mips@linux-mips.org>
Message-ID: <20150121113748.VKeoCCcVs3V-U9aGMdQX-lgcMTBAwbM3GXco1jDBK5A@z>

On 01/19/2015 03:56, Joshua Kinard wrote:
> From: Joshua Kinard <kumba@gentoo.org>
> 
> This patch splits the old R10000 definitions so that the R10000_LLSC_WAR can be
> disabled and -mno-fix-r10000 passed to CFLAGS for systems running R12000 CPUs
> and greater.  This allows the kernel to build without branch-likely
> instructions, which are considered deprecated in current MIPS implementations.
>  Only R10000 systems with R2.6 and lower CPUs require branch-likely to work
> around a known hardware errata item.
