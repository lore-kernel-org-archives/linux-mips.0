Received: from mail-bn3nam01on0123.outbound.protection.outlook.com ([104.47.33.123]:61628
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993928AbeDOOoympcsu convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 15 Apr 2018 16:44:54 +0200
From: Sasha Levin <Alexander.Levin@microsoft.com>
Subject: Re: [PATCH AUTOSEL for 4.14 043/161] MIPS: JZ4770: Work around
 config2 misreporting associativity
Date: Sun, 15 Apr 2018 14:44:45 +0000
Message-ID: <20180415144443.GR2341@sasha-vm>
References: <20180409001936.162706-1-alexander.levin@microsoft.com>
 <20180409001936.162706-43-alexander.levin@microsoft.com>
 <20180409200838.GB17347@saruman>
In-Reply-To: <20180409200838.GB17347@saruman>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A4189D4C1E5693469236E6E4724659E0@namprd21.prod.outlook.com>
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
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maarten ter Huurne <maarten@treewalker.org>, Ralf Baechle <ralf@linux-mips.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>

On Mon, Apr 09, 2018 at 09:08:38PM +0100, James Hogan wrote:
>On Mon, Apr 09, 2018 at 12:20:20AM +0000, Sasha Levin wrote:
>> From: Maarten ter Huurne <maarten@treewalker.org>
>>
>> [ Upstream commit 1f7412e0e2f327fe7dc5a0c2fc36d7b319d05d47 ]
>>
>> According to config2, the associativity would be 5-ways, but the
>> documentation states 4-ways, which also matches the documented
>> L2 cache size of 256 kB.
>
>JZ4770 support is new in 4.16, so no need for this to be backported.
>More likely it'll just break the build due to references to
>MACH_INGENIC_JZ4770.
>
>Cheers
>James

Now removed, thanks James!
