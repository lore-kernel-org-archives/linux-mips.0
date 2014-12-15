Received: from mail-by2on0068.outbound.protection.outlook.com ([207.46.100.68]:55894
        "EHLO na01-by2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27008875AbaLOV3nYK3Na (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 15 Dec 2014 22:29:43 +0100
Message-ID: <548F52B8.7030606@caviumnetworks.com>
Date: Mon, 15 Dec 2014 13:29:28 -0800
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 14/14] MIPS: OCTEON: Handle OCTEON III in csrc-octeon.
References: <1418666603-15159-1-git-send-email-aleksey.makarov@auriga.com> <1418666603-15159-15-git-send-email-aleksey.makarov@auriga.com> <20141215212422.GD10323@fuloong-minipc.musicnaut.iki.fi>
In-Reply-To: <20141215212422.GD10323@fuloong-minipc.musicnaut.iki.fi>
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
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Aleksey Makarov <feumilieu@gmail.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>, Aleksey Makarov <aleksey.makarov@auriga.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20141215212928.4D7cfF0La5oLvGwYPDS5P-8BZ0-fWuv4et6lODAdds4@z>

On 12/15/2014 01:24 PM, Aaro Koskinen wrote:
> Hi,
>
> On Mon, Dec 15, 2014 at 09:03:20PM +0300, Aleksey Makarov wrote:
>>   	if (current_cpu_type() == CPU_CAVIUM_OCTEON2) {
>>   		union cvmx_mio_rst_boot rst_boot;
>> +
>>   		rst_boot.u64 = cvmx_read_csr(CVMX_MIO_RST_BOOT);
>>   		rdiv = rst_boot.s.c_mul;	/* CPU clock */
>>   		sdiv = rst_boot.s.pnr_mul;	/* I/O clock */
>>   		f = (0x8000000000000000ull / sdiv) * 2;
>> +	} else if (current_cpu_type() == CPU_CAVIUM_OCTEON3) {
>> +		union cvmx_rst_boot rst_boot;
>> +
>> +		rst_boot.u64 = cvmx_read_csr(CVMX_RST_BOOT);
>> +		rdiv = rst_boot.s.c_mul;	/* CPU clock */
>> +		sdiv = rst_boot.s.pnr_mul;	/* I/O clock */
>> +		f = (0x8000000000000000ull / sdiv) * 2;
>>   	}
>
> The f = ... part could be moved outside the if blocks to avoid copy paste.
>

No, If you look at the rest of the file, you will find that there are 
checks in the form:

   if (f != 0) ...

There is a reason that we leave f with its default value of zero in some 
of the cases.

David Daney
