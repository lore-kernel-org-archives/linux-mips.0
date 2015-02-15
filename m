Received: from mailapp01.imgtec.com ([195.59.15.196]:60276 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012661AbbBOBX5rB0gv (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 15 Feb 2015 02:23:57 +0100
Message-ID: <54DFF510.5060104@imgtec.com>
Date: Sat, 14 Feb 2015 17:23:28 -0800
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: MIPS: CONFIG_CPU_MIPS_R6?
References: <1423934805.9418.23.camel@x220>
In-Reply-To: <1423934805.9418.23.camel@x220>
Content-Type: text/plain; charset="utf-8"; format=flowed
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
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Valentin Rothberg <valentinrothberg@gmail.com>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20150215012328.uBApXd3sm7Zs3n8soJKjSBjf5Mze4NiSApkkLTKGT4U@z>

On 02/14/2015 09:26 AM, Paul Bolle wrote:
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
Yes, please.

- Leonid.
