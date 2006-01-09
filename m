Received: from nwd2mail1.analog.com ([137.71.25.50]:5781 "EHLO
	nwd2mail1.analog.com") by ftp.linux-mips.org with ESMTP
	id S8133437AbWAIEvX (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Mon, 9 Jan 2006 04:51:23 +0000
Message-ID: <200601090453.k094rfaZ028956@lilac.hdcindia.analog.com>
From: "Sathesh Babu Edara" <satheshbabu.edara@analog.com>
Subject: LL and SC instruction simulation
Date: Mon, 9 Jan 2006 10:24:14 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <43BBC85C.4040405@mips.com>
Return-Path: <satheshbabu.edara@analog.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips-bounce@linux-mips.org, linux-mips@linux-mips.org
Message-ID: <20060109045414.0FJ7mbCVRqmYVER1ndJ-qk1zce81gkvoWXvoQy3eAQ4@z>

 
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
uClibc version -0.9.26
For linux-2.6.12 : We use GCC version -3.4.3 binutils version -2.15 and
uClibc version -0.9.28.

Thanks in advance.

Regards,
Sathesh  
