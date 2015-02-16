Received: from mailapp01.imgtec.com ([195.59.15.196]:63456 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009840AbbBPHrT1SCR0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 16 Feb 2015 08:47:19 +0100
Date: Mon, 16 Feb 2015 07:46:52 +0000
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: Re: MIPS: CONFIG_CPU_MIPS_R6?
Message-ID: <20150216074652.GA25858@mchandras-linux.le.imgtec.org>
References: <1423934805.9418.23.camel@x220>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1423934805.9418.23.camel@x220>
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
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Valentin Rothberg <valentinrothberg@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20150216074652.T3rksw56sVOWz7Ays5pONy2tj05ua4Ac0BjPRGfbHcM@z>

On Sat, Feb 14, 2015 at 06:26:45PM +0100, Paul Bolle wrote:
> Your commit 33d73a3d4159 ("MIPS: lib: memset: Add MIPS R6 support") is
> included in yesterday's linux next (ie, next-20150213). I noticed
> because a script I use to check linux-next spotted a trivial problem
> with it.
> 
> It added a reference to CONFIG_CPU_MIPS_R6 in comment. Should I submit
> the trivial patch to change that into a reference to CONFIG_CPU_MIPSR6
> or do you prefer to do that yourself?
> 
> 
> Paul Bolle
> 
Hi Paul,

Ok thanks I will fix both.

-- 
markos
