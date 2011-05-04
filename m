Received: from usmamail.tilera.com ([206.83.70.75]:62377 "EHLO
        USMAMAIL.TILERA.COM" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S1490998Ab1EDMJ3 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 4 May 2011 14:09:29 +0200
Message-ID: <4DC141EC.5050406@tilera.com>
Date: Wed, 4 May 2011 08:09:16 -0400
From: Chris Metcalf <cmetcalf@tilera.com>
MIME-Version: 1.0
Subject: Re: [PATCH] atomic: add *_dec_not_zero
References: <1304458235-28473-1-git-send-email-sven@narfation.org>
In-Reply-To: <1304458235-28473-1-git-send-email-sven@narfation.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <cmetcalf@tilera.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Sven Eckelmann <sven@narfation.org>
Cc: linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>, x86@kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, uclinux-dist-devel@blackfin.uclinux.org, linux-cris-kernel@axis.com, linux-ia64@vger.kernel.org, linux-m32r@ml.linux-m32r.org, linux-m68k@lists.linux-m68k.org, linux-mips@linux-mips.org, linux-am33-list@redhat.com, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org
Message-ID: <20110504120916.XstzKmgF_tTmG9eY-LxIgNOe-Pm-jRqKc368SAeOONY@z>

On 5/3/2011 5:30 PM, Sven Eckelmann wrote:
> Introduce an *_dec_not_zero operation.  Make this a special case of
> *_add_unless because batman-adv uses atomic_dec_not_zero in different
> places like re-broadcast queue or aggregation queue management. There
> are other non-final patches which may also want to use this macro.
>
> Reported-by: David S. Miller <davem@davemloft.net>
> Signed-off-by: Sven Eckelmann <sven@narfation.org>
> [...]
>  arch/tile/include/asm/atomic.h     |    9 +++++++++
>  arch/tile/include/asm/atomic_32.h  |    1 +

Acked-by: Chris Metcalf <cmetcalf@tilera.com>

-- 
Chris Metcalf, Tilera Corp.
http://www.tilera.com
