Received: from mailapp01.imgtec.com ([195.89.28.115]:57591 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6821191AbaDII61NsCVc (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 9 Apr 2014 10:58:27 +0200
Message-ID: <53450BBE.7050501@imgtec.com>
Date: Wed, 9 Apr 2014 09:58:38 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: MIPS: Remove last traces of SMTC Support too?
References: <1397033309.22767.8.camel@x220>
In-Reply-To: <1397033309.22767.8.camel@x220>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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
To: Paul Bolle <pebolle@tiscali.nl>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20140409085838.Jt3tiheOD1zXgPbCQaKrij2UHP6Y2oWAXHqZPRcTEg8@z>

On 04/09/2014 09:48 AM, Paul Bolle wrote:
> The patch "MIPS: Remove SMTC Support" landed in linux-next (see
> next-20140409). A quick grep of the tree suggests a follow up is needed
> (a sort-of-patch is pasted below).
>
> Is a similar follow up queued somewhere? If not, should I submit a patch
> or should I wait with doing that until "MIPS: Remove SMTC Support" hits
> mainline?
>
>
> Paul Bolle

Hi Paul,

I talked to Ralf yesterday. It seems the patch was not applied correctly 
and there are a few traces left. My original patch definitely removes 
the traces listed in your patch.

You can compare the original patch

https://patchwork.linux-mips.org/patch/6719/

with the one currently present in upstream-sfr/mips-for-linux-next branch

-- 
markos
