Received: from mailapp01.imgtec.com ([195.59.15.196]:6132 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994800AbdFPB5I7hv30 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jun 2017 03:57:08 +0200
Date: Fri, 16 Jun 2017 02:56:51 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH] MIPS: Make individual platforms select
 ARCH_MIGHT_HAVE_PC_SERIO
In-Reply-To: <20170605171033.15008-1-f.fainelli@gmail.com>
Message-ID: <alpine.DEB.2.00.1706160249370.23046@tp.orcam.me.uk>
References: <20170605171033.15008-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@linux-mips.org, msalter@redhat.com, dmitry.torokhov@gmail.com, Ralf Baechle <ralf@linux-mips.org>, open list <linux-kernel@vger.kernel.org>
Message-ID: <20170616015651.NYRteigySt1q0-LwoRretaL-k78Eeghll1DszmYpT50@z>

On Mon, 5 Jun 2017, Florian Fainelli wrote:

> Out of the many MIPS platforms only 3 appear to be actually using an
> I8042 keyboard controller: SGI, JAZZ and LOOGSON64, remove
> ARCH_MIGHT_HAVE_PC_SERIO from the top-level MIPS Kconfig symbol and move
> it down to those platforms that need it.

 How did you determine that?  Malta for one not only has an SMSC FDC37M817 
Super I/O Controller featuring an 8042-compatible core, but actual PS/2 
keyboard and mouse connectors as well.

  Maciej
