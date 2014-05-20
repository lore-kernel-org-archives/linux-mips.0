Received: from mail-bn1lp0145.outbound.protection.outlook.com ([207.46.163.145]:37763
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6855085AbaETXXMSR-qV (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 21 May 2014 01:23:12 +0200
Message-ID: <537BE3D7.1070904@caviumnetworks.com>
Date: Tue, 20 May 2014 16:23:03 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 03/15] MIPS: OCTEON: Move CAVIUM_OCTEON_CVMSEG_SIZE to
 CPU_CAVIUM_OCTEON
References: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com> <1400597236-11352-4-git-send-email-andreas.herrmann@caviumnetworks.com> <3124276.AVUgu1xWyv@radagast>
In-Reply-To: <3124276.AVUgu1xWyv@radagast>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@imgtec.com>
Cc: linux-mips@linux-mips.org, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, David Daney <ddaney.cavm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140520232303.BztycKgllE7fHm8RWF9ii6kKyfz0jjSg9RzIgMABZZg@z>

On 05/20/2014 03:52 PM, James Hogan wrote:
> Hi Andreas,
>
> On Tuesday 20 May 2014 16:47:04 Andreas Herrmann wrote:
>> From: David Daney <david.daney@cavium.com>
>>
>> CVMSEG is related to the CPU core not the SoC system.  So needs to be
>> configurable there.
>>
>> Signed-off-by: David Daney <david.daney@cavium.com>
>> Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
>> ---
>>   arch/mips/cavium-octeon/Kconfig |   30 ++++++++++++++++++++----------
>>   1 file changed, 20 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/mips/cavium-octeon/Kconfig
>> b/arch/mips/cavium-octeon/Kconfig index 227705d..c5e9975 100644
>> --- a/arch/mips/cavium-octeon/Kconfig
>> +++ b/arch/mips/cavium-octeon/Kconfig
[...]
>> -config CAVIUM_OCTEON_CVMSEG_SIZE
>> -	int "Number of L1 cache lines reserved for CVMSEG memory"
>> -	range 0 54
>> -	default 1
>> +config CAVIUM_OCTEON_HW_FIX_UNALIGNED
>> +	bool "Enable hardware fixups of unaligned loads and stores"
>> +	default "y"
>
> Is adding CAVIUM_OCTEON_HW_FIX_UNALIGNED in this patch intentional? It seems
> unrelated.
>

Good catch.  CAVIUM_OCTEON_HW_FIX_UNALIGNED and its users were removed, 
we shouldn't add it back.  I think this is a case of rebasing gone wrong.

David Daney
