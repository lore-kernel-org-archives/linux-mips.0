Received: from mailapp01.imgtec.com ([195.59.15.196]:18102 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011376AbbDUJiTqdHWv (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 21 Apr 2015 11:38:19 +0200
Message-ID: <55361A86.9060000@imgtec.com>
Date: Tue, 21 Apr 2015 10:38:14 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH V2] MIPS: Loongson: Naming style cleanup and rework
References: <1429581635-26476-1-git-send-email-chenhc@lemote.com>
In-Reply-To: <1429581635-26476-1-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset="windows-1252"
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
To: Huacai Chen <chenhc@lemote.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, Kelvin Cheung <keguang.zhang@gmail.com>
Message-ID: <20150421093814.5kY4Czvlory9eTojLGf8YQHFY1h7u40pplwvZrU0GrA@z>

Hi,

On 04/21/2015 03:00 AM, Huacai Chen wrote:
> Currently, code of Loongson-2/3 is under loongson directory and code of
> Loongson-1 is under loongson1 directory. Besides, there are Kconfig
> options such as MACH_LOONGSON and MACH_LOONGSON1. This naming style is
> very ugly and confusing. Since Loongson-2/3 are both 64-bit general-
> purpose CPU while Loongson-1 is 32-bit SoC, we rename both file names
> and Kconfig symbols from loongson/loongson1 to loongson64/loongson32.
> 
> V2: Update Kconfig description.
This ^^^^ needs to be below the '---' part of the patch because it
should not be part of the commit message. It is just a changelog for the
patch itself.

> 
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
^^^ Please add "V2:..." here instead.

-- 
markos
