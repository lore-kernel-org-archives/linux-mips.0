Received: from mailapp01.imgtec.com ([195.89.28.115]:47591 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6817552AbaCQJ1FbtGnm (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 17 Mar 2014 10:27:05 +0100
Message-ID: <5326BFE1.2060400@imgtec.com>
Date: Mon, 17 Mar 2014 09:26:57 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Fix syscall tracing interface
References: <1395042021-6186-1-git-send-email-larper@axis.com>
In-Reply-To: <1395042021-6186-1-git-send-email-larper@axis.com>
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
To: Lars Persson <lars.persson@axis.com>, linux-mips@linux-mips.org
Cc: Lars Persson <larper@axis.com>
Message-ID: <20140317092657.PMBceUmyo0SPAYq4c05ezjSMnRh_LvYWr7kTxTzMI8M@z>

Hi Lars,

On 03/17/2014 07:40 AM, Lars Persson wrote:
> The MIPS syscall tracing interface had multiple bugs
> that made it completely unusable.
>
> Signed-off-by: Lars Persson <larper@axis.com>

The last part of your patch will conflict with

http://patchwork.linux-mips.org/patch/6402/

which is already in the linux-next tree.

The rest of the changes look reasonable to me.

I believe it is best if you base your patches on 
upstream-sfr/mips-for-linux-next[1] branch.

[1] 
http://git.linux-mips.org/?p=ralf/upstream-sfr.git;a=shortlog;h=refs/heads/mips-for-linux-next

-- 
markos
