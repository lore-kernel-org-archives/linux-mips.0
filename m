Subject: Re: Compilers question
Date: Thu, 17 Jan 2002 13:41:20 +0000 (GMT)
In-Reply-To: <3C45CE3B.6080507@galileo.co.il> from "Rabeeh Khoury" at Jan 16, 2002 09:02:19 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E16RCnA-0003KU-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: Rabeeh Khoury <rabeeh@galileo.co.il>
Cc: linux-mips@oss.sgi.com
Message-ID: <20020117134120._TCwzASPTyuP0tMeiRZ0S6WUjdoDV1DF0-fzi9WYN-0@z>

> The factors that I can identify till now are two -
> 1.. Distribute the binary in ELF format (are there any compilers that
> don't support ELF ? )
> 2.. Compile the binary that it is ABI compliant
> 
> Please add more factors that should be checked, or even suggest another 
> approach to overcome this problem (other than I get the other person 
> tool chain and compile the sources myself).

Assuming you plan to ship just the binary

3. Ensure you also either ship .o files or you avoid using libc, ld.so and any
other LGPL components (license requirements). 

4. Check you use no GPL libraries (normally not likely)

Alan
