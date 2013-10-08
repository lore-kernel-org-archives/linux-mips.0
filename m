Received: from multi.imgtec.com ([194.200.65.239]:20637 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6832655Ab3JHMU6LYxgZ (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 8 Oct 2013 14:20:58 +0200
Message-ID: <5253F8B3.3070700@imgtec.com>
Date: Tue, 8 Oct 2013 13:21:07 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Print correct PC in trace dump after NMI exception
References: <1381232371-25017-1-git-send-email-markos.chandras@imgtec.com> <593AEF6C47F46446852B067021A273D6D990182F@MUCSE039.lantiq.com>
In-Reply-To: <593AEF6C47F46446852B067021A273D6D990182F@MUCSE039.lantiq.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
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
To: thomas.langer@lantiq.com, linux-mips@linux-mips.org
Cc: Leonid.Yegoshin@imgtec.com
Message-ID: <20131008122107.ydLMWLG83TtthI00Lrwh1nKFzGRVaOUrxQ2yKYjt36c@z>

On 10/08/13 12:48, thomas.langer@lantiq.com wrote:
> Hello Markos,
>
> If this is a YAMON specific fix, why is it done in a common file?
>
Hi Thomas,

I can see how the commit message can be a bit misleading. However, it's 
not YAMON specific. The NMI was just delivered by YAMON because we patch 
the default NMI location in YAMON (see mti-malta/malta-init.c).
NMI, Reset and Cache Error exceptions use ErrorEPC instead of EPC so 
this patch is platform independent.
