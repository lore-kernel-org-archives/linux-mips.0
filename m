Received: from mailapp01.imgtec.com ([195.89.28.115]:49792 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6834667AbaDKPBrjmGcr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 11 Apr 2014 17:01:47 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 03B20BE2D0C51
        for <linux-mips@linux-mips.org>; Fri, 11 Apr 2014 16:01:38 +0100 (IST)
Message-ID: <534803D4.4000706@imgtec.com>
Date: Fri, 11 Apr 2014 16:01:40 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Fix 'write_msa_##' inline macro.
References: <1397228277-7594-1-git-send-email-Steven.Hill@imgtec.com>
In-Reply-To: <1397228277-7594-1-git-send-email-Steven.Hill@imgtec.com>
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
To: linux-mips@linux-mips.org
Message-ID: <20140411150140.vC8vaUJtNLOKN_CYDdONjuCqMlIjiwxvrRFGC7QdF0w@z>

Hi Steven,

On 04/11/2014 03:57 PM, Steven J. Hill wrote:
> instruction, which should be the 'ctcmmsa' instruction.

I guess this is a typo? ^^^ (double 'mm' in 'ctcmmsa')

-- 
markos
