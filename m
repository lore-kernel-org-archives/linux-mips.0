Received: from mailapp01.imgtec.com ([195.59.15.196]:17701 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013073AbbETTYKfwOGY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 20 May 2015 21:24:10 +0200
Message-ID: <555CDF14.70900@imgtec.com>
Date: Wed, 20 May 2015 12:23:00 -0700
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] MIPS: MSA: bugfix of keeping MSA live context through
 clone or fork
References: <20150519211222.35859.52798.stgit@ubuntu-yegoshin> <20150519211359.35859.24907.stgit@ubuntu-yegoshin>
In-Reply-To: <20150519211359.35859.24907.stgit@ubuntu-yegoshin>
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
To: linux-mips@linux-mips.org, rusty@rustcorp.com.au, alexinbeijing@gmail.com, paul.burton@imgtec.com, david.daney@cavium.com, alex@alex-smith.me.uk, linux-kernel@vger.kernel.org, ralf@linux-mips.org, james.hogan@imgtec.com, markos.chandras@imgtec.com, macro@linux-mips.org, eunb.song@samsung.com, manuel.lauss@gmail.com, andreas.herrmann@caviumnetworks.com
Message-ID: <20150520192300.6R5nZQNpm1HcB5e3Ghg6VJOiqbQh0Y_1x-FM0E7aq9Y@z>

Cancel this, please.

Reason - MSA registers are not supposed to be preserved through 
caller-called interface, including syscall.
In other side, keeping MSA context is expensive.

- Leonid.
