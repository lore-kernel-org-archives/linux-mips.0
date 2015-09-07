Received: from mailapp01.imgtec.com ([195.59.15.196]:3338 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006709AbbIGI3cM0lMV (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 7 Sep 2015 10:29:32 +0200
Subject: Re: [PATCH 1/2 for-4.3] MIPS: BPF: Avoid unreachable code on little
 endian
References: <1441471618-5613-1-git-send-email-aurelien@aurel32.net>
From: Markos Chandras <Markos.Chandras@imgtec.com>
Message-ID: <55ED4AE5.6060404@imgtec.com>
Date: Mon, 7 Sep 2015 09:29:25 +0100
MIME-Version: 1.0
In-Reply-To: <1441471618-5613-1-git-send-email-aurelien@aurel32.net>
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
To: Aurelien Jarno <aurelien@aurel32.net>, linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150907082925.wNBKx9aYh3NU_SzCaYq-ZQjL8Te4W_wHXxxFDTVsPhc@z>

On 09/05/2015 05:46 PM, Aurelien Jarno wrote:
> On little endian, avoid generating the big endian version of the code
> by using #else in addition to #ifdef #endif. Also fix one alignment
> issue wrt delay slot.
> 
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Markos Chandras <markos.chandras@imgtec.com>
> Cc: stable@vger.kernel.org # v4.2+
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  arch/mips/net/bpf_jit_asm.S | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>

-- 
markos
