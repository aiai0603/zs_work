<template>
    <div class="blackp">
      <img :src="carprop" class="blackimg">

       <div class="blackword">

               <slot></slot>

       </div>

    </div>
</template>

<script>
  export default {
      name: 'black',
      props:{
        carprop:{

        }
      }


  };
</script>

<style>

   .blackp:hover .blackimg{
     transform: scale(1.2);
     transition: 0.25s ;
   }
  .blackp{
    width: 400px;
    height: 200px;
    position: relative;
    margin: 10px;
    overflow: hidden;
  }

  .blackimg{
    position: absolute;
    width: 100%;
    height: 100%;
    top:0px;
    left: 0px;

  }
  .blackword{
    position: absolute;
    background-color: rgba(0,0,0,0.7);
    width: 100%;
    height: 100%;
    display: flex;
    flex-flow: column;
    align-items: center;
    justify-content: center;
    color: white;
    top:0px;
    left: 0px;
  }
</style>
