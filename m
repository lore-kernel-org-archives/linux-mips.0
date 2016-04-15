Received: from mail-db3on0056.outbound.protection.outlook.com ([157.55.234.56]:56320
        "EHLO emea01-db3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27026175AbcDOT0rsitMY (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 15 Apr 2016 21:26:47 +0200
Subject: Re: [PATCH V3 06/29] Tile and MIPS (if has usable __builtin_popcount)
 use popcount parity functions
References: <1460601525-3822-1-git-send-email-zengzhaoxiu@163.com>
 <1460603162-4670-1-git-send-email-zengzhaoxiu@163.com>
From: Chris Metcalf <cmetcalf@mellanox.com>
Message-ID: <5711405D.5040807@mellanox.com>
Date: Fri, 15 Apr 2016 15:26:21 -0400
MIME-Version: 1.0
In-Reply-To: <1460603162-4670-1-git-send-email-zengzhaoxiu@163.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <cmetcalf@mellanox.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: zengzhaoxiu@163.com, linux-kernel@vger.kernel.org
Cc: Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20160415192621.vNWvMj1AXUXKBetKX-QR5q-bFw5Bt9o2JTyjYHXzhgk@z>

On 4/13/2016 11:05 PM, zengzhaoxiu@163.com wrote:
> From: Zhaoxiu Zeng<zhaoxiu.zeng@gmail.com>
>
> Signed-off-by: Zhaoxiu Zeng<zhaoxiu.zeng@gmail.com>
> ---
>   arch/mips/include/asm/bitops.h | 7 +++++++
>   arch/tile/include/asm/bitops.h | 2 ++
>   2 files changed, 9 insertions(+)

Acked-by: Chris Metcalf <cmetcalf@mellanox.com> [for tile]

-- 
Chris Metcalf, Mellanox Technologies
http://www.mellanox.com
