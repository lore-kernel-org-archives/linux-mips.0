Received: from mailapp01.imgtec.com ([195.59.15.196]:20966 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27025206AbbBCSkRfAOwg (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 3 Feb 2015 19:40:17 +0100
Message-ID: <54D11608.2070408@imgtec.com>
Date: Tue, 3 Feb 2015 10:40:08 -0800
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: mips: Re-introduce copy_user_page
References: <1422681807-28395-1-git-send-email-linux@roeck-us.net>
In-Reply-To: <1422681807-28395-1-git-send-email-linux@roeck-us.net>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Guenter Roeck <linux@roeck-us.net>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Matthew Wilcox <matthew.r.wilcox@intel.com>
Message-ID: <20150203184008.JQcTl-iYxNccKQ4gKMDu1RR8ynM1wSpmAJhZWCsFXc0@z>

On 01/30/2015 09:23 PM, Guenter Roeck wrote:
> Commit bcd022801ee5 ("MIPS: Fix COW D-cache aliasing on fork") replaced
> the inline function copy_user_page for mips with an external reference,
> but neglected to introduce the actual non-inline function. Restore it.
>
> Fixes: bcd022801ee5 ("MIPS: Fix COW D-cache aliasing on fork")
> Fixes: 4927b7d77c00 ("dax,ext2: replace the XIP page fault handler with the DAX page fault handler")
> Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
> Cc: Matthew Wilcox <matthew.r.wilcox@intel.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>

Why do you use copy_user_page?
It doesn't work properly in HIGHMEM environment and it is excluded from 
MIPS because of that, I believe.

You should use copy_user_highpage() for user pages.

- Leonid.
