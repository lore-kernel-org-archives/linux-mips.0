Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:32585 "EHLO
        mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6817420AbaHMANoBr09q (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 13 Aug 2014 02:13:44 +0200
Date: Wed, 13 Aug 2014 05:48:50 +0530
From: Jayachandran C. <jchandra@broadcom.com>
Subject: Re: [PATCH 1/2] MIPS: Move CPU topology macros to topology.h
Message-ID: <20140813001849.GA27602@jayachandranc.netlogicmicro.com>
References: <1407467768-24097-1-git-send-email-chenhc@lemote.com>
 <20140808134738.GG29898@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20140808134738.GG29898@linux-mips.org>
Return-Path: <jchandra@broadcom.com>
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
Cc: Huacai Chen <chenhc@lemote.com>, John Crispin <john@phrozen.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>, linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>
Message-ID: <20140813001850.jpNeEHGgB3gb2ga9IIScRwsIoy3dRDWh64rtF85SXg4@z>

On Fri, Aug 08, 2014 at 03:47:38PM +0200, Ralf Baechle wrote:
> Jayachandran,
> 
> could you convert the netlogic platforms to use this scheme, too?
> We then could drop the #ifdefs introduced by this patch.

The same sequence is used by ip27 platform as well, so I think the
ifndef may still be needed. This is the same ifndef pattern we use
for all our mach-generic/*.h vs. mach-<platform>/*.h

On second thought, I am not sure if the changes in Huacai's patch
has to be in asm/topology.h, probably this has to be in
mach-generic/topology.h

JC.
