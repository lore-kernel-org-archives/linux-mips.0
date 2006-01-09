Received: from nwd2mail2.analog.com ([137.71.25.51]:21405 "EHLO
	nwd2mail2.analog.com") by ftp.linux-mips.org with ESMTP
	id S8133612AbWAIHq7 (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Mon, 9 Jan 2006 07:46:59 +0000
Message-ID: <200601090749.k097nFaZ017891@lilac.hdcindia.analog.com>
From: "Sathesh Babu Edara" <satheshbabu.edara@analog.com>
Subject: LL and SC instruction simulation
Date: Mon, 9 Jan 2006 13:19:46 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <200601090742.k097gYaZ017304@lilac.hdcindia.analog.com>
Return-Path: <satheshbabu.edara@analog.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips-bounce@linux-mips.org, linux-mips@linux-mips.org
Message-ID: <20060109074946.G1FH0uUVYftCU5hj3-VmDadg2p_NBwSZ-g4kaZN9skQ@z>

 

Hi,
   We have ported linux-2.4.18 and linux-2-6.12 kernel (mips.org)onto MIPS
processor (CPU type lx4189).

 We observed that on 2.4 kernel,ll and sc instruction exception handlers
hitting very often.
Where as on linux-2.6.12 this is not happening.

Can anybody have idea why this instructions are hitting on 2.4.18 kernel and
not on 2-6.12 kernel.

What is the significance of these instructions?.

Note :
   For linux-2.4.18 : We use GCC version -3.3.4 binutils version -2.15 and
uClibc version -0.9.26 For linux-2.6.12 : We use GCC version -3.4.3 binutils
version -2.15 and uClibc version -0.9.28.

Thanks in advance.

Regards,
Sathesh  
