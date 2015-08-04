Received: from mailapp01.imgtec.com ([195.59.15.196]:60821 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012433AbbHDTPcQR4P1 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 4 Aug 2015 21:15:32 +0200
Message-ID: <55C10F4B.2050003@imgtec.com>
Date: Tue, 4 Aug 2015 12:15:23 -0700
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: MIPS: Make set_pte() SMP safe.
References: <1438649323-1082-1-git-send-email-ddaney.cavm@gmail.com>
In-Reply-To: <1438649323-1082-1-git-send-email-ddaney.cavm@gmail.com>
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
To: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: David Daney <david.daney@cavium.com>, stable@vger.kernel.org
Message-ID: <20150804191523.OVGqEkoiGYS3llY2Kqiq3TYDMo7zr42ong1poFFJrng@z>

David,

Did you observe this in real?
The function __get_vm_area_node() allocates a guard page if flag 
VM_NO_GUARD is not used and I don't see any use of it in source.

In past vmap allocated a guard page even unconditionally.

- Leonid.
