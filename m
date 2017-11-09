Received: from fldsmtpe03.verizon.com ([140.108.26.142]:63402 "EHLO
        fldsmtpe03.verizon.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990593AbdKIQnvKtM9l convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 9 Nov 2017 17:43:51 +0100
From: "Levin, Alexander (Sasha Levin)" <alexander.levin@one.verizon.com>
Subject: Re: [PATCH AUTOSEL for-4.4 39/39] MIPS: Use Makefile.postlink to
 insert relocations into vmlinux
Date: Thu, 9 Nov 2017 16:42:21 +0000
Message-ID: <20171109164218.vdnku5kzm3trezuw@sasha-lappy>
References: <20171108205027.27525-1-alexander.levin@verizon.com>
 <20171108205027.27525-39-alexander.levin@verizon.com>
 <fc334f42-f3ca-b03c-d8de-ce7d9ffdf5e3@mips.com>
In-Reply-To: <fc334f42-f3ca-b03c-d8de-ce7d9ffdf5e3@mips.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <13A63AD4DCF7DD45B7BA0B52C6129BC3@vzwcorp.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <alexander.levin@one.verizon.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Matt Redfearn <matt.redfearn@mips.com>
Cc: "Levin, Alexander (Sasha Levin)" <alexander.levin@one.verizon.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Matt Redfearn <matt.redfearn@imgtec.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20171109164221.EKbrdo20ir-y3bRNxlV5orK0pryTtDaZxLOPJxnHn3o@z>

On Thu, Nov 09, 2017 at 09:16:44AM +0000, Matt Redfearn wrote:
>
>
>On 08/11/17 20:50, Levin, Alexander (Sasha Levin) wrote:
>>From: Matt Redfearn <matt.redfearn@imgtec.com>
>>
>>[ Upstream commit 44079d3509aee89c58f3e4fd929fa53ab2299019 ]
>>
>>When relocatable support for MIPS was merged, there was no support for
>>an architecture to add a postlink step for vmlinux. This meant that only
>>invoking a target within the boot directory, such as uImage, caused the
>>relocations to be inserted into vmlinux. Building just the vmlinux
>>target would result in a relocatable kernel with no relocation
>>information present.
>>
>>Commit fbe6e37dab97 ("kbuild: add arch specific post-link Makefile")
>
>Hi,
>
>This patch depends on upstream commit fbe6e37dab97 ("kbuild: add arch 
>specific post-link Makefile") which was introduced in v4.9.
>
>This patch is an improvement to the build flow and I would not 
>consider it for backporting - certainly not to v4.8 or earlier which 
>is missing the dependency. Applying it will not break anything, 
>however, it will perform no function either without the supporting 
>dependency.

I'll just drop it from 4.9 and 4.4 then, Thanks Matt.

-- 

Thanks,
Sasha
