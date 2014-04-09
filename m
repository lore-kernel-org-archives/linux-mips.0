Received: from mailapp01.imgtec.com ([195.89.28.115]:46516 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6834662AbaDITnti3s0Y (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 9 Apr 2014 21:43:49 +0200
Message-ID: <5345A2EB.8020109@imgtec.com>
Date: Wed, 9 Apr 2014 14:43:39 -0500
From: "Steven J. Hill" <Steven.Hill@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: microMIPS: Work around an assembler bug.
References: <1396892446-23883-1-git-send-email-Steven.Hill@imgtec.com>
In-Reply-To: <1396892446-23883-1-git-send-email-Steven.Hill@imgtec.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <Steven.Hill@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: ralf@linux-mips.org
Message-ID: <20140409194339.PZ6h_tluZywmzjvBkoAIt7frTwaN_QllSKKltQY1rP8@z>

On 04/07/2014 12:40 PM, Steven J. Hill wrote:
> From: "Steven J. Hill" <Steven.Hill@imgtec.com>
> 
> In newer toolchains, the 16-bit branch delay slot instruction
> calculation is wrong. We get a message very similar to:
> 
>    {standard input}: Assembler messages:
>    {standard input}:7035: Warning: wrong size instruction
>    in a 16-bit branch delay slot
> 
> This corner case only occurs in 'arch/mips/kernel/traps.c' and
> we add the '-fno-delayed-branch' option when compiling it.
> 
> Signed-off-by: Steven J. Hill <Steven.Hill@imgtec.com>
>
I rejected this in patchwork. Just making sure you do not use it.
