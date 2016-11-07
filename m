Received: from mailapp01.imgtec.com ([195.59.15.196]:1385 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991986AbcKGUG1XjW58 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 7 Nov 2016 21:06:27 +0100
Message-ID: <5820DEBA.6080800@imgtec.com>
Date: Mon, 7 Nov 2016 12:06:18 -0800
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: MIPS: MIPS74K needs post dma flush
References: <20161107194128.25086-2-svens@stackframe.org>
In-Reply-To: <20161107194128.25086-2-svens@stackframe.org>
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
To: Sven Schnelle <svens@stackframe.org>, linux-mips@linux-mips.org
Message-ID: <20161107200618.SI_iWWeT_3ByNsQQRTPVlMxwf14Buw9FB1oF7WNWazY@z>

74K does NOT have an aggressive speculation, never for D-Cache, never 
for I-cache. D-Cache doesn't an advance speculation load at all, I-cache 
never does a wrong speculation.

So, post-DMA flush is not needed in any form.

- Leonid.
