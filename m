Received: from mailapp01.imgtec.com ([195.59.15.196]:61222 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6861334AbaGRKFrxG0ge (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 18 Jul 2014 12:05:47 +0200
Message-ID: <53C8F174.70603@imgtec.com>
Date: Fri, 18 Jul 2014 11:05:40 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 7/7] MIPS: GIC: Fix GICBIS macro
References: <1405585259-24941-1-git-send-email-markos.chandras@imgtec.com> <1405585259-24941-8-git-send-email-markos.chandras@imgtec.com> <53C7C5E2.1020307@cogentembedded.com> <53C8D2AE.3020300@imgtec.com>
In-Reply-To: <53C8D2AE.3020300@imgtec.com>
Content-Type: text/plain; charset="ISO-8859-1"
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
To: Jeffrey Deans <jeffrey.deans@imgtec.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-mips@linux-mips.org
Message-ID: <20140718100540.ut-lOfcFriorcqFMdbFr63A_32BRdQaNdNFvcYsQf1I@z>

On 07/18/2014 08:54 AM, Jeffrey Deans wrote:
> 
>>
>>> +        data &= ~(mask);        \
>>> +        data |= ((bits) & (mask));    \
>>
>>     Outer () not needed.
> 
> Agreed.
> 
Thanks for the review. This is a minor fix and I see no reason for v2.
Ralf could you please remove the outer () when you get to apply this patch?

Thanks!

-- 
markos
