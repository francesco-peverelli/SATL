package spatialtemplates
import pe._

/**
  * Abstract class defining a utility method used to generate connections between PEs in a spatialt template
  */
abstract class InterfaceGenerator {

    /**
      * Returns the IDs of the PE that a given element is connected to. The specific behavior is
      * given by the concrete implementation of each generator.
      *
      * @param myID identifier for the element to query
      */
    def getConnectionsIDs(myID: ElemId) : Seq[ElemId];
}
/**
  * Interface generator used to instantiate a template with connection to it's orthogonal neighbors.
  * In 1D, it returns up to 2 connections, in 2D up to 4 and in 3D up to 6. Elements facing the edges
  * of the domain have fewer connections.
  *
  * @param dims A sequence containing the domain dimensions. The length of the sequence must be equal
  * to the number of domain dimensions, thus <= 3.
  */
class OrthogonalNeighborsInterfaceGenerator(dims: Seq[Int]) extends InterfaceGenerator {
    /**
      * Returns the neighboring elements
      *
      * @param myID
      */
    def getConnectionsIDs(myID: ElemId) : Seq[ElemId] = {
        if(dims.length < 1) {
            return Seq(new ElemId(-1, -1, -1, -1))
        }
        var out_seq = Seq(new ElemId(myID.dim,(0 max (myID.x-1)), myID.y, myID.z),
            new ElemId(myID.dim,((dims(0)-1) min (myID.x+1)), myID.y, myID.z))
        if(dims.length > 1) {
          out_seq = out_seq ++ Seq(new ElemId(myID.dim, myID.x, (0 max (myID.y-1)), myID.z),
            new ElemId(myID.dim, myID.x, ((dims(0)-1) min (myID.y+1)), myID.z))
        }
        if(dims.length > 2) {
          out_seq = out_seq ++ Seq(new ElemId(myID.dim, myID.x, myID.y, (0 max (myID.z-1))),
            new ElemId(myID.dim, myID.x, myID.y, ((dims(0)-1) min (myID.z+1))))
        }
        return out_seq.filter(_ != myID)
    }
}
