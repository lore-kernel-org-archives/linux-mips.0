Received: from mail-eopbgr40111.outbound.protection.outlook.com ([40.107.4.111]:43008
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23990421AbdLTIWS0lv1f (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 20 Dec 2017 09:22:18 +0100
Subject: Re: [RFC] MIPS memblock: Remove bootmem code and switch to NO_BOOTMEM
References: <20171219201400.GA10185@mobilestation>
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <e4ef6c82-f3c1-1a07-9f0f-cd442130ef37@nokia.com>
Date: Wed, 20 Dec 2017 09:20:02 +0100
MIME-Version: 1.0
In-Reply-To: <20171219201400.GA10185@mobilestation>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Return-Path: <alexander.sverdlin@nokia.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Serge Semin <fancer.lancer@gmail.com>, ralf@linux-mips.org, paul.burton@imgtec.com, rabinv@axis.com, matt.redfearn@imgtec.com, james.hogan@imgtec.com, marcin.nowakowski@imgtec.com, f.fainelli@gmail.com, kumba@gentoo.org
Cc: Sergey.Semin@t-platforms.ru, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20171220082002.bWbgJ-YbBuZdu_-XCNrwjRo7C0y-e2Y_KGdrmiQhKSU@z>

Hello Serge,

On 19/12/17 21:14, Serge Semin wrote:
> Almost a year ago I sent a patchset to the Linux MIPS community. The main target of the patchset
> was to get rid from the old bootmem allocator usage at the MIPS architecture. Additionally I had
> a problem with CMA usage on my MIPS machine due to some struct page-related issue. Moving to the
> memblock allocator fixed the problem and gave us benefits like smaller memory consumption,
> powerful memblock API to be used within the arch code.

[...]

> @alexander.sverdlin@nokia.com. Do you still possess the Octeon MIPS64 platform to test the patchset?

yes, I'd like to test such a serious change on Octeon2. Please include me in the distribution list.

-- 
Best regards,
Alexander Sverdlin.
