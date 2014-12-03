Received: from mailapp01.imgtec.com ([195.59.15.196]:42849 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008064AbaLCXzZ7AYD1 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 4 Dec 2014 00:55:25 +0100
Message-ID: <547FA2E5.1040105@imgtec.com>
Date: Wed, 3 Dec 2014 15:55:17 -0800
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] MIPS: Add full ISA emulator.
References: <1417650258-2811-1-git-send-email-ddaney.cavm@gmail.com> <1417650258-2811-3-git-send-email-ddaney.cavm@gmail.com>
In-Reply-To: <1417650258-2811-3-git-send-email-ddaney.cavm@gmail.com>
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
To: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: Zubair.Kakakhel@imgtec.com, geert+renesas@glider.be, peterz@infradead.org, paul.gortmaker@windriver.com, macro@linux-mips.org, chenhc@lemote.com, cl@linux.com, mingo@kernel.org, richard@nod.at, zajec5@gmail.com, james.hogan@imgtec.com, keescook@chromium.org, tj@kernel.org, alex@alex-smith.me.uk, pbonzini@redhat.com, blogic@openwrt.org, paul.burton@imgtec.com, qais.yousef@imgtec.com, linux-kernel@vger.kernel.org, markos.chandras@imgtec.com, dengcheng.zhu@imgtec.com, manuel.lauss@gmail.com, lars.persson@axis.com, David Daney <david.daney@cavium.com>
Message-ID: <20141203235517.chTVzeZREGke7X6anJscLdf1WSBBjp4gsEQNS80q3mk@z>

On 12/03/2014 03:44 PM, David Daney wrote:

(...)

Big work but it doesn't support customized instructions, multiple ASEs, 
MIPS R6 etc.

Well, it is still not a replacement of XOL emulation.
Even close.
