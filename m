Received: from mailapp01.imgtec.com ([195.59.15.196]:12114 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008889AbbGNIczioOux (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Jul 2015 10:32:55 +0200
Date: Tue, 14 Jul 2015 09:32:48 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH 1/2] MIPS: PCI: ops-emma2rh: drop nonsensical db_assert
Message-ID: <20150714083248.GE2519@NP-P-BURTON>
References: <1436804062-30041-1-git-send-email-paul.burton@imgtec.com>
 <20150714083029.GA25179@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20150714083029.GA25179@linux-mips.org>
Return-Path: <Paul.Burton@imgtec.com>
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
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20150714083248.0ZfOuYKNJBc0W3TAgXqvom_3EUhZQ5fBxIzvu-3RbYo@z>

On Tue, Jul 14, 2015 at 10:30:30AM +0200, Ralf Baechle wrote:
> On Mon, Jul 13, 2015 at 05:14:21PM +0100, Paul Burton wrote:
> 
> > The db_assert call checks whether the bus_num pointer is non-NULL, but
> > does so after said pointer has been dereferenced by the assignment on
> > the previous line. Thus the check is pointless & likely to have been
> > optimised out by the compiler anyway. The check_args function is static
> > & only ever called from the local file with bus_num being a pointer to
> > an on-stack variable, so the check seems somewhat overzealous anyway.
> > Simply remove it.
> 
> Thanks, applied.
> 
> Your patch btw. leaves the db_verify() macro as the sole caller of
> db_assert() and db_verify() itself is unused and in fact, nothing
> includes <asm/debug.h> anymore.  Removing <asm/debug.h> leaves
> CONFIG_RUNTIME_DEBUG unused, so I'm removing that one, too.
> 
>   Ralf

Hi Ralf,

That's precisely what led me to write this patch, and precisely what the
following patch I submitted (MIPS: drop CONFIG_RUNTIME_DEBUG & debug.h)
does:

    http://patchwork.linux-mips.org/patch/10693/

Thanks,
    Paul
