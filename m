Received: from mail-co1nam03on0108.outbound.protection.outlook.com ([104.47.40.108]:62048
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993885AbeDOOj6wMDHu convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 15 Apr 2018 16:39:58 +0200
From: Sasha Levin <Alexander.Levin@microsoft.com>
Subject: Re: [PATCH AUTOSEL for 4.15 048/189] clk: ingenic: Fix recalc_rate
 for clocks with fixed divider
Date: Sun, 15 Apr 2018 14:39:48 +0000
Message-ID: <20180415143946.GO2341@sasha-vm>
References: <20180409001637.162453-1-alexander.levin@microsoft.com>
 <20180409001637.162453-48-alexander.levin@microsoft.com>
 <20180409201242.GC17347@saruman>
In-Reply-To: <20180409201242.GC17347@saruman>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D3BC5A9F59EBA94BAA52163265182304@namprd21.prod.outlook.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <Alexander.Levin@microsoft.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <jhogan@kernel.org>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Cercueil <paul@crapouillou.net>, Ralf Baechle <ralf@linux-mips.org>, Maarten ter Huurne <maarten@treewalker.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20180415143948.PRC5neVagwrig2AXFMRhRbyDSC_LpQetGb3m3xq6sDk@z>

On Mon, Apr 09, 2018 at 09:12:42PM +0100, James Hogan wrote:
>On Mon, Apr 09, 2018 at 12:17:24AM +0000, Sasha Levin wrote:
>> From: Paul Cercueil <paul@crapouillou.net>
>>
>> [ Upstream commit e6cfa64375d34a6c8c1861868a381013b2d3b921 ]
>>
>> Previously, the clocks with a fixed divider would report their rate
>> as being the same as the one of their parent, independently of the
>> divider in use. This commit fixes this behaviour.
>>
>> This went unnoticed as neither the jz4740 nor the jz4780 CGU code
>> have clocks with fixed dividers yet.
>
>FYI this one isn't strictly necessary for backport since JZ4770 support
>is new in 4.16, but its probably harmless too.
>
>Cheers
>James

I'll drop it, thanks James!
