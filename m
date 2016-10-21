Received: from mail-pf0-f193.google.com ([209.85.192.193]:34632 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992009AbcJUAwOlZXvN (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 21 Oct 2016 02:52:14 +0200
Date: Fri, 21 Oct 2016 11:51:47 +1100
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/6] MIPS: Use thin archives & dead code elimination
Message-ID: <20161021115147.0f6eea51@roar.ozlabs.ibm.com>
In-Reply-To: <20161020202705.3783-1-paul.burton@imgtec.com>
References: <20161020202705.3783-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-Path: <npiggin@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20161021005147.aRfdCTIMbXIiNKb-GSNXG7ubY3j6pGFBmifyv_RK_OM@z>

Hey Paul,

On Thu, 20 Oct 2016 21:26:59 +0100
Paul Burton <paul.burton@imgtec.com> wrote:

> This series fixes a few issues with CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
> and then enables it, along with CONFIG_THIN_ARCHIVES, for MIPS. This
> leads to a typical generic kernel build becoming ~5% smaller:
> 
>   add/remove: 0/3028 grow/shrink: 1/14 up/down: 18/-457362 (-457344)
>   ...
>   Total: Before=9001030, After=8543686, chg -5.08%
> 
> Applies atop v4.9-rc1.


Very nice, and thanks for the kbuild fixes, I think they all look sane.

Let's try to get those kbuild fixes in through the kbuild tree first
(which has some other fixes required for 4.9). I can take them and send
them to kbuild maintainer if you like.

On powerpc we'll likely provide an option to select these manually for
4.9 because there has been the odd toolchain issue come up, so that's
something to consider.

For your linker script, you may consider putting the function sections
into the same input as other text. TEXT_TEXT does not include .text.*,
so mips's .text.* below it will catch those.

You may just open-code your TEXT_TEXT, and have:

*(.text.hot .text .text.fixup .text.unlikely .text.[0-9a-zA-Z_]*)

or similar.

Thanks,
Nick
